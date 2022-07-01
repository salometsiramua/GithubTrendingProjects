//
//  URLOpenerServiceTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 09.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class URLOpenerServiceTests: XCTestCase {

    func testURLOpenerServiceWithSuccess() {
        let urlOpenerService = URLOpenerService(application: ApplicatoinServiceMock(success: true))
        urlOpenerService.go(to: "test") { result in
            XCTAssertEqual(result, true)
        }
    }

    func testURLOpenerServiceWithFail() {
        let urlOpenerService = URLOpenerService(application: ApplicatoinServiceMock(success: false))
        urlOpenerService.go(to: "test") { result in
            XCTAssertEqual(result, false)
        }
    }
}
