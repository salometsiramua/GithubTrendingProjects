//
//  RepositoriesListNavigation.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import Foundation

protocol RepositoriesListNavigation {
    func openRepositoryDetails(for item: ProjectItem, imageLoader: ImageLoader)
}
