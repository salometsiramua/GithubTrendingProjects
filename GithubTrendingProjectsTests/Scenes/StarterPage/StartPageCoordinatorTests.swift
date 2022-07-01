//
//  StartPageCoordinatorTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class StartPageCoordinatorTests: XCTestCase {

    func testStartPageCoordinatorEnterTheApp() {
        let urlOpener = URLOpenerMock(success: true)
        let coordinator = StartPageCoordinator(navigationController: UINavigationController(), urlOpener: urlOpener, imageLoader: ImageLoaderMock(success: true))
        coordinator.enterApp()
        XCTAssertEqual(coordinator.children.count, 1)
    }

    func testStartPageCoordinator() {
        let exp = expectation(description: "url opener called")
        let urlOpener = URLOpenerMock(success: true)
        urlOpener.handler = {
            exp.fulfill()
        }

        let coordinator = StartPageCoordinator(navigationController: UINavigationController(), urlOpener: urlOpener, imageLoader: ImageLoaderMock(success: true))
        coordinator.openURL("test.com")

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

}
