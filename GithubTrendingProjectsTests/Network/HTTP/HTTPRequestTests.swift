//
//  HTTPRequestTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class HTTPRequestTests: XCTestCase {

    func testHTTPrequest() {
        let httpRequest = HTTPServiceRequest(endpoint: MockEndpoint())
        XCTAssertEqual(httpRequest.urlRequest.url?.absoluteString, "github.com/tests/testMock")
        XCTAssertEqual(httpRequest.urlRequest.httpMethod, "GET")
    }

}
