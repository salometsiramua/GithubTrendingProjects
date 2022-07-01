//
//  RepositoriesFetchServiceMock.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoriesFetchServiceMock: RepositoriesFetcherService {

    var loadListHandler: (()->())?
    func loadList(completionHandler: @escaping (Result<RepositoriesResponse, Error>) -> Void) {
        loadListHandler?()
    }
}
