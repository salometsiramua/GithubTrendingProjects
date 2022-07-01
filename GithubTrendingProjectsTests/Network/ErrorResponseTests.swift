//
//  ErrorResponseTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class ErrorResponseTests: XCTestCase {

    func testNetworkErrorDescriptions() {
        XCTAssertEqual(ErrorResponse.responseDataIsNil.description, "URL response data is nil")
        XCTAssertEqual(ErrorResponse.responseIsNil.description, "URL response is nil")
        XCTAssertEqual(ErrorResponse.responseParsingToJsonDictionary.description, "Could not parse to json dictionary")
        XCTAssertEqual(ErrorResponse.urlIsInvalid.description, "URL is invalid")
        XCTAssertEqual(ErrorResponse.noInternetConnection.description, "No internet connection")
    }
}
