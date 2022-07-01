//
//  HTTPRequestSession.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

protocol HTTPRequestSession: AnyObject {
    func request(_ request: HTTPRequest, completion: @escaping HTTPRequestSessionCompletion)
}

final class HTTPSession: HTTPRequestSession {

    private var dataTask: URLSessionDataTask?
    private var session: NetworkSession

    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    func request(_ request: HTTPRequest, completion: @escaping HTTPRequestSessionCompletion) {
        guard let url = request.urlRequest.url else { return }
        session.loadData(from: url, completionHandler: completion)
    }

}
