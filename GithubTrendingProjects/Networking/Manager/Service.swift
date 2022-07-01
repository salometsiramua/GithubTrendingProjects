//
//  Service.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

enum Service {
    case repositories
}

extension Service: Endpoint {

    var baseUrl: URL {
        guard let url = URL(string: Strings.Service.endpoint.rawValue) else {
            return URL(string: Strings.Service.dummyEndoint.rawValue)!
        }
        return url
    }

    var path: String {
        switch self {
        case .repositories:
            return Strings.Service.repositoriesPath.rawValue
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .repositories:
            return .get
        }
    }
}

