//
//  ErrorResponse.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

enum ErrorResponse: Error {
    case responseIsNil
    case responseDataIsNil
    case responseParsingToJsonDictionary
    case urlIsInvalid
    case noInternetConnection
}

extension ErrorResponse {
    var description: String {
        switch self {
        case .responseIsNil:
            return "URL response is nil"
        case .responseDataIsNil:
            return "URL response data is nil"
        case .responseParsingToJsonDictionary:
            return "Could not parse to json dictionary"
        case .urlIsInvalid:
            return "URL is invalid"
        case .noInternetConnection:
            return "No internet connection"
        }
    }
}
