//
//  ServiceManager.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

protocol MappableResponse {
    init(data: Data) throws
}

class ServiceManager<Response: MappableResponse> {

    typealias ResponseObject = Response
    typealias ServiceSuccessCallback = ((ResponseObject) -> Void)
    typealias ServiceFailureCallback = ((Error) -> Void)

    private let service: Endpoint
    private let session: NetworkSession
    private let httpService: HTTPRequestSession

    private var onSuccessCallback: ServiceSuccessCallback?
    private var onFailureCallback: ServiceFailureCallback?

    init(session: NetworkSession = URLSession.shared, _ service: Endpoint) {
        self.session = session
        self.service = service
        self.httpService = HTTPSession(session: session)
    }

    @discardableResult
    convenience init(session: NetworkSession = URLSession.shared, _ service: Endpoint, onSuccess: @escaping ServiceSuccessCallback, onFailure: @escaping ServiceFailureCallback) {

        self.init(session: session, service)
        onSuccessCallback = onSuccess
        onFailureCallback = onFailure

        call()
    }

}

extension ServiceManager {

    private func call() {

        let request = HTTPServiceRequest(endpoint: service)

        guard Reachability.isConnectedToNetwork else {
            self.onFailureCallback?(ErrorResponse.noInternetConnection)
            return
        }

        httpService.request(request) { (data, response, error) in

            if let error = error {
                self.onFailureCallback?(error)
                return
            }

            guard response != nil else {
                self.onFailureCallback?(ErrorResponse.responseIsNil)
                return
            }

            guard let data = data else {
                self.onFailureCallback?(ErrorResponse.responseDataIsNil)
                return
            }

            do {
                let mapped = try Response(data: data)
                self.onSuccessCallback?(mapped)
            } catch {
                self.onFailureCallback?(error)
            }
        }
    }

}
