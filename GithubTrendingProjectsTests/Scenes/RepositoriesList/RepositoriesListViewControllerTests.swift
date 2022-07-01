//
//  RepositoriesListViewControllerTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoriesListViewControllerTests: XCTestCase {

    var viewModelMock: RepositoriesListViewModelMock!

    override func setUp() async throws {
        viewModelMock = RepositoriesListViewModelMock()
    }

    private func makeViewController(with model: RepositoriesListViewModelMock) -> RepositoriesListViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: RepositoriesListViewController.identifier) as! RepositoriesListViewController

        vc.viewModel = model
        UIWindow().addSubview(vc.view)
        return vc
    }

    func testRepositoriesListViewControllerListLoaded() {
        XCTAssertFalse(viewModelMock.listLoaded)
        _ = makeViewController(with: viewModelMock)
        XCTAssertTrue(viewModelMock.listLoaded)
    }

    func testRepositoriesListViewControllerSearch() {
        let viewController = makeViewController(with: viewModelMock)
        viewController.searchBar(viewController.searchBar, textDidChange: "Salome")
        XCTAssertEqual(viewModelMock.searchedText, "Salome")
    }

    func testRepositoriesListViewControllerDidSelectItem() {
        let viewController = makeViewController(with: viewModelMock)
        viewController.tableView(viewController.listTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(viewModelMock.selectedItem, 0)
    }

    func testRepositoriesListViewControllerDidSelectItemNonZeroIndex() {
        let viewController = makeViewController(with: viewModelMock)
        viewController.tableView(viewController.listTableView, didSelectRowAt: IndexPath(row: 34, section: 0))
        XCTAssertEqual(viewModelMock.selectedItem, 34)
    }

    func testRepositoriesList() {
        let viewController = makeViewController(with: viewModelMock)
        viewController.viewDidLoad()

        let cell = viewController.listTableView.cellForRow(at: IndexPath(row: 2, section: 0))
        XCTAssertEqual(cell?.reuseIdentifier, ProjectItemCell.identifier)
    }

}

class RepositoriesListViewModelMock: RepositoriesListViewModel {

    var coordinator: RepositoriesCoordinator?

    var listItemsCount: Int = 23

    var isUserInteractionEnabledOnSearchBar: Bool = true

    var selectedItem: Int? = nil
    var searchedText: String = ""
    var listLoaded: Bool = false

    func loadList() {
        listLoaded = true
    }

    func listItem(at index: Int) -> ProjectItem {
        ProjectItem.mock
    }

    func didSelectItem(at index: Int) {
        selectedItem = index
    }

    func search(for text: String) {
        searchedText = text
    }
}
