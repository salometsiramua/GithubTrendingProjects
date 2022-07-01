//
//  NetworkSessionMock.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import Foundation
@testable import GithubTrendingProjects

class NetworkSessionMock: NetworkSession {

    var data: Data?
    var error: Error?

    func loadData(from url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(data, nil, error)
    }
}
