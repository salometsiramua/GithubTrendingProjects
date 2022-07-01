//
//  RepositoriesListViewModelTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoriesListViewModelTests: XCTestCase {

    func testRepositoriesListViewModelInit() {
        let imageLoaderMock = ImageLoaderMock()
        let coordinator = RepositoriesListCoordinatorMock()
        let model = RepositoriesListViewModelObject(coordinator: coordinator, networkService: RepositoriesFetchServiceMock(), imageLoader: imageLoaderMock)
        XCTAssertNotNil(model.coordinator)
    }

    func testRepositoriesListViewModelStart() {
        let exp = expectation(description: "load list called")
        let serviceMock = RepositoriesFetchServiceMock()
        serviceMock.loadListHandler = {
            exp.fulfill()
        }
        let model = RepositoriesListViewModelObject(coordinator: RepositoriesListCoordinatorMock(), networkService: serviceMock, imageLoader: ImageLoaderMock())
        model.loadList()

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testRepositoriesListViewModelListItemsCount() {
        let serviceMock = RepositoriesFetchServiceMock()
        let model = RepositoriesListViewModelObject(coordinator: RepositoriesListCoordinatorMock(), networkService: serviceMock, imageLoader: ImageLoaderMock())
        XCTAssertEqual(model.listItemsCount, 0)
    }
}

class RepositoriesListCoordinatorMock: RepositoriesCoordinator {
    var parentCoordinator: Coordinator?

    var children: [Coordinator] = []

    var navigationController: UINavigationController = UINavigationController()

    var openRepositoryDetailsHandler: (()->())?

    var startHandler: (()->())?
    
    func start() {
        startHandler?()
    }

    func openRepositoryDetails(for item: ProjectItem, imageLoader: ImageLoader) {
        openRepositoryDetailsHandler?()
    }
}
