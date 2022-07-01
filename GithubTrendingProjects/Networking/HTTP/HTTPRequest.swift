//
//  HTTPRequest.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

protocol HTTPRequest {
    var urlRequest: URLRequest { get }
}

struct HTTPServiceRequest: HTTPRequest {

    let urlRequest: URLRequest

    init(endpoint: Endpoint) {

        let url = endpoint.baseUrl.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue

        if request.value(forHTTPHeaderField: "Content-Type")?.isEmpty != false {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        self.urlRequest = request

    }
}

