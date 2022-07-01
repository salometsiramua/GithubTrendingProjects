//
//  CoordinatorTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class CoordinatorTests: XCTestCase {

    func testCoordinatorChildrenEmpty() {
        let coordinator: Coordinator = AppCoordinator(navigationController: UINavigationController(), urlOpener: URLOpenerMock(success: true))
        XCTAssertTrue(coordinator.children.isEmpty)
    }

    func testCoordinatorChildrenNotEmpty() {
        let coordinator: Coordinator = AppCoordinator(navigationController: UINavigationController(), urlOpener: URLOpenerMock(success: true))
        coordinator.start()
        XCTAssertEqual(coordinator.children.count, 1)
    }

    func testCoordinatorChildrenEpmtyAgain() {
        let coordinator: AppCoordinator = AppCoordinator(navigationController: UINavigationController(), urlOpener: URLOpenerMock(success: true))
        coordinator.start()
        XCTAssertEqual(coordinator.children.count, 1)
        coordinator.childDidFinish(coordinator.children.first!)
        XCTAssertEqual(coordinator.children.count, 0)
    }
}
