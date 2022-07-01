//
//  RepositoriesListCoordinatorTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoriesListCoordinatorTests: XCTestCase {

    func testRepositoriesListCoordinatorEnterTheApp() {
        let imageLoader = ImageLoaderMock(success: true)
        let coordinator = RepositoriesListCoordinator(navigationController: UINavigationController(), imageLoader: ImageLoaderMock(success: true))
        let projectItem = ProjectItem.mock
        coordinator.openRepositoryDetails(for: projectItem, imageLoader: imageLoader)
        XCTAssertEqual(coordinator.children.count, 1)
    }
}
