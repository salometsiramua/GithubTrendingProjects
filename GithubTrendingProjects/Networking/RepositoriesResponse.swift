//
//  RepositoriesResponse.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

struct RepositoriesResponse {
    var repositoryContent: [RepositoryContent]
}

extension RepositoriesResponse: MappableResponse {
    init(data: Data) throws {
        repositoryContent = try JSONDecoder().decode(Array<RepositoryContent>.self, from: data)
    }
}

struct RepositoryContent: Codable {
    var rank: Int
    var username: String
    var repositoryName: String
    var url: String
    var description: String?
    var language: String?
    var languageColor: String?
    var totalStars: Int
    var forks: Int
    var starsSince: Int
    var since: String?
    var builtBy: [User]?
}

struct User: Codable {
    var username: String
    var url: String
    var avatar: String
}
