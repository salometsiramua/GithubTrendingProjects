//
//  ProjectItem.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import UIKit

struct ProjectItem {
    let projectName: String
    let projectDescription: String?
    let projectTotalStars: String?
    let language: String?
    let languageColor: UIColor?
    let totalStars: Int
    let rank: Int
    let username: String

    let url: String
    let forks: Int
    let starsSince: Int
    let since: String?
    let builtBy: [User]?

    init(from content: RepositoryContent) {
        self.projectName = content.repositoryName
        self.projectDescription = content.description
        self.projectTotalStars = "\(content.totalStars) Stars"
        self.totalStars = content.totalStars
        self.rank = content.rank
        self.username = content.username

        self.url = content.url
        self.language = content.language
        self.languageColor = content.languageColor.map { UIColor($0) } ?? .darkGrayText 

        self.forks = content.forks
        self.starsSince = content.starsSince
        self.since = content.since
        self.builtBy = content.builtBy
    }

    func contains(text: String) -> Bool {
        guard !text.isEmpty else {
            return true
        }

        return projectName.lowercased().contains(text.lowercased()) ||
        (projectDescription?.lowercased().contains(text.lowercased()) ?? false) ||
        username.lowercased().contains(text.lowercased()) ||
        totalStars.description.contains(text) ||
        forks.description.contains(text) ||
        starsSince.description.contains(text)
    }
}
