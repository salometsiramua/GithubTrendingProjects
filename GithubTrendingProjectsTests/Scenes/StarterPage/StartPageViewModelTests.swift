//
//  StartPageViewModelTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class StartPageViewModelTests: XCTestCase {

    func testStartPageViewModelGotoXapo() {
        let exp = expectation(description: "Go to xapo method called")
        let coordinator = StartCoordinatorMock()
        coordinator.gotoXapoCallback = {
            exp.fulfill()
        }
        let viewModel = StartPageViewModelObject(coordinator: coordinator)
        viewModel.gotoXapo()

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testStartPageViewModelEnterTheApp() {
        let exp = expectation(description: "Enter the app method called")
        let coordinator = StartCoordinatorMock()
        coordinator.enterTheAppCallback = {
            exp.fulfill()
        }
        let viewModel = StartPageViewModelObject(coordinator: coordinator)
        viewModel.enterApp()

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

}

class StartCoordinatorMock: StartCoordinator {

    var parentCoordinator: Coordinator?

    var children: [Coordinator] = []

    var navigationController: UINavigationController = UINavigationController()

    var enterTheAppCallback: (()->())?
    var gotoXapoCallback: (()->())?
    var startCallback: (()->())?

    func start() {
        startCallback?()
    }

    func enterApp() {
        enterTheAppCallback?()
    }

    func openURL(_ url: String) {
        gotoXapoCallback?()
    }

}
