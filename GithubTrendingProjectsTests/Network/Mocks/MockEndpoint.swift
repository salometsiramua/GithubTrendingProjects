//
//  MockEndpoint.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import Foundation
@testable import GithubTrendingProjects

struct MockEndpoint: Endpoint {
    
    var baseUrl: URL
    var path: String
    var httpMethod: HTTPMethod
    
    init(baseUrl: URL = URL(string: "github.com/tests/")!, path: String = "testMock", httpMethod: HTTPMethod = .get) {
        self.baseUrl = baseUrl
        self.path = path
        self.httpMethod = httpMethod
    }

}
