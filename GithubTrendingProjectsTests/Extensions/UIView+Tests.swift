//
//  UIView+Tests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class UIViewTests: XCTestCase {

    func testViewIdentifier() {
        XCTAssertEqual(ProjectItemCell.identifier, "ProjectItemCell")
        XCTAssertEqual(UIView.identifier, "UIView")
    }
}
