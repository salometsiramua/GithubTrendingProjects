//
//  RepositoriesFetcherService.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import Foundation

protocol RepositoriesFetcherService {
    func loadList(completionHandler: @escaping (Result<RepositoriesResponse, Error>) -> Void)
}

final class RepositoriesNetworkServiceObject: RepositoriesFetcherService {

    let session: NetworkSession

    init(session: NetworkSession) {
        self.session = session
    }

    func loadList(completionHandler: @escaping (Result<RepositoriesResponse, Error>) -> Void) {
        ServiceManager<RepositoriesResponse>(session: session, Service.repositories, onSuccess: { (response) in
            completionHandler(.success(response))
        }) { (error) in
            completionHandler(.failure(error))
        }
    }
}
