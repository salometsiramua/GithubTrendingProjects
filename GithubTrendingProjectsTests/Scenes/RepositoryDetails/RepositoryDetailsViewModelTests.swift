//
//  RepositoryDetailsViewModelTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoryDetailsViewModelTests: XCTestCase {
    func testViewModelOpenURLHandler() {
        let urlOpenerMock = URLOpenerMock(success: true)
        let imageLoaderMock = ImageLoaderMock(success: true)
        let projectItem = ProjectItem.mock
        let coordinator = DetailsCoordinatorMock()
        let exp = expectation(description: "Start handler called")
        coordinator.openURLHandler = {
            exp.fulfill()
        }

        let model = RepositoryDetailsViewModelObject(coordinator: coordinator, projectItem: projectItem, urlOpener: urlOpenerMock, imageLoader: imageLoaderMock)
        model.openOnGithub()

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testViewModelOpenURLAnotherHandler() {
        let urlOpenerMock = URLOpenerMock(success: true)
        let imageLoaderMock = ImageLoaderMock(success: true)
        let projectItem = ProjectItem.mock
        let coordinator = DetailsCoordinatorMock()
        let exp = expectation(description: "Start handler called")
        coordinator.openURLHandler = {
            exp.fulfill()
        }

        let model = RepositoryDetailsViewModelObject(coordinator: coordinator, projectItem: projectItem, urlOpener: urlOpenerMock, imageLoader: imageLoaderMock)
        model.gotoProfile()

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testRepositoryDetailsViewModelValues() {
        let viewModel = RepositoryDetailsViewModelObject(coordinator: DetailsCoordinatorMock(), projectItem: ProjectItem.mock, imageLoader: ImageLoaderMock())
        XCTAssertEqual(viewModel.language!, "swift")
        XCTAssertEqual(viewModel.repositoryName, "github/Salome")
        XCTAssertEqual(viewModel.url, "github.com")
        XCTAssertEqual(viewModel.description, ProjectItem.mock.projectDescription)
        XCTAssertEqual(viewModel.usersUrl, ProjectItem.mock.builtBy?.first?.url)
        XCTAssertEqual(viewModel.ratingViewContent as! RatingViewData, RatingViewData(content: ProjectItem.mock))
    }
}

class DetailsCoordinatorMock: DetailsCoordinator {

    var parentCoordinator: Coordinator?

    var children: [Coordinator] = []

    var navigationController: UINavigationController = UINavigationController()

    var openURLHandler: (()->())?

    var startHandler: (()->())?

    func start() {
        startHandler?()
    }

    func openURL(_ url: String) {
        openURLHandler?()
    }
}
