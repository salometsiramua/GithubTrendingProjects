//
//  HTTPMethodTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class HTTPMethodTests: XCTestCase {

    func testRawValues() {
      
        XCTAssertEqual(HTTPMethod.get.rawValue, "GET")
    }

}
