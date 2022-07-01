//
//  UIViewController+Tests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class UIViewControllerTests: XCTestCase {

    func testIdentifier() {
     
        XCTAssertEqual(RepositoriesListViewController.identifier, "RepositoriesListViewController")
        XCTAssertEqual(RepositoryDetailsViewController.identifier, "RepositoryDetailsViewController")
        
    }

}
