//
//  RepositoryContentTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class ProjectItemTests: XCTestCase {

    func initProjectItem() -> ProjectItem {
        ProjectItem(from: RepositoryContent(rank: 23, username: "Salome", repositoryName: "github", url: "github.com", description: "long text", language: "swift", languageColor: "#000000", totalStars: 32, forks: 145, starsSince: 23, since: "Daily", builtBy: [User(username: "Goga", url: "github.com", avatar: "avatar.png")]))
    }

    func testProjectItemColor() {
        let projectItem = initProjectItem()
        XCTAssertEqual(projectItem.languageColor, UIColor("#000000"))
    }

    func testProjectItemContains() {
        let projectItem = initProjectItem()
        XCTAssertTrue(projectItem.contains(text: "Sal"))
    }
    
    func testProjectItemDoesNotContain() {
        let projectItem = initProjectItem()
        XCTAssertFalse(projectItem.contains(text: "Tsiramua"))
    }

    func testProjectItemContainsInName() {
        let projectItem = initProjectItem()
        XCTAssertTrue(projectItem.contains(text: "Git"))
    }
    
    func testProjectItemContainsStarsCount() {
        let projectItem = initProjectItem()
        XCTAssertTrue(projectItem.contains(text: "23"))
    }
    
    func testProjectItemContainsEmptyString() {
        let projectItem = initProjectItem()
        XCTAssertTrue(projectItem.contains(text: ""))
    }
    
    func testProjectItemContainsInNameCaseInsensitive() {
        let projectItem = initProjectItem()
        XCTAssertTrue(projectItem.contains(text: "sAL"))
    }

}
