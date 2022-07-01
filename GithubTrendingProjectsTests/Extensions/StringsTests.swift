//
//  StringsTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//
import XCTest
@testable import GithubTrendingProjects

class StringsTests: XCTestCase {
    
    func testStringValues() {
        
        XCTAssertEqual(Strings.StartPage.gotoXapoButton.rawValue, "Go to Xapo")
        XCTAssertEqual(Strings.RepositoryDetails.forks.rawValue, "Forks")
        XCTAssertEqual(Strings.RepositoryDetails.stars.rawValue, "Stars")
        XCTAssertEqual(Strings.RepositoryDetails.openOnGithub.rawValue, "Open on github")
    }

    func testTextProperty() {
        XCTAssertEqual(Strings.RepositoryDetails.forks.text, "Forks")
    }
    
}
