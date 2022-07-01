//
//  RepositoryDetailsCoordinatorTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoryDetailsCoordinatorTests: XCTestCase {

    func testRepositoryDetailsCoordinatorEnterTheApp() {
        let projectItem = ProjectItem.mock
        let imageLoader = ImageLoaderMock(success: true)
        let urlOpenerMock = URLOpenerMock(success: true)
        let exp = expectation(description: "url opener service called")
        urlOpenerMock.handler = {
            exp.fulfill()
        }
        let coordinator = RepositoryDetailsCoordinator(navigationController: UINavigationController(), urlOpener: urlOpenerMock, imageLoader: imageLoader, projectItem: projectItem)
        coordinator.openURL("test.url")

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testNavigationControllerBackAction() {
        func testRepositoryDetailsCoordinatorEnterTheApp() {
            let projectItem = ProjectItem.mock
            let imageLoader = ImageLoaderMock(success: true)
            let urlOpenerMock = URLOpenerMock(success: true)
            let exp = expectation(description: "url opener service called")

            urlOpenerMock.handler = {
                exp.fulfill()
            }
            let coordinator = RepositoryDetailsCoordinator(navigationController: UINavigationController(), urlOpener: urlOpenerMock, imageLoader: imageLoader, projectItem: projectItem)
            coordinator.openURL("test.url")

            waitForExpectations(timeout: 0.5) { (error) in
                if let error = error {
                    XCTFail("Error: \(error)")
                }
            }
        }
    }
}

extension ProjectItem {
    static var mock: ProjectItem {
        ProjectItem(from: RepositoryContent(rank: 23, username: "Salome", repositoryName: "github", url: "github.com", description: "long text", language: "swift", languageColor: "#000000", totalStars: 32, forks: 145, starsSince: 23, since: "Daily", builtBy: [User(username: "George", url: "github.com", avatar: "avatar.png")]))
    }
}
