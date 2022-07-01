//
//  HTTPRequestMock.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import Foundation
@testable import GithubTrendingProjects

struct HTTPRequestMock: HTTPRequest {
    
    var urlRequest: URLRequest {
        let url = URL(string: urlString)!
        return URLRequest(url: url)
    }
    
    private let urlString: String
    
    init(urlString: String = "localhost.com/tests") {
        self.urlString = urlString
    }
    
}

