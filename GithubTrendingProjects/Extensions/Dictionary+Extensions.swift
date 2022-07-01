//
//  Dictionary+Extensions.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 06.05.22.
//

import Foundation

extension Dictionary: MappableResponse where Key == String, Value == Any {

    init(data: Data) throws {
        let object = try JSONSerialization.jsonObject(with: data, options: [])

        guard let dictionary = object as? [String: Any] else {
            throw ErrorResponse.responseParsingToJsonDictionary
        }

        self = dictionary
    }
}
