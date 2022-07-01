//
//  HTTPSessionTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class HTTPSessionTests: XCTestCase {

    var networkSession: NetworkSessionMock!
    var session: HTTPSession!

    override func setUp() async throws {
        networkSession = NetworkSessionMock()
        session = HTTPSession(session: networkSession)
    }

    func testForData() {
        let exp = expectation(description: "Returns data")
        networkSession.data = Data()
        session.request(HTTPRequestMock(urlString: "test")) { data, response, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            exp.fulfill()
        }

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testForError() {
        let exp = expectation(description: "Returns error")
        networkSession.error = ErrorResponse.urlIsInvalid
        session.request(HTTPRequestMock(urlString: "test")) { data, response, error in
            XCTAssertEqual(error as? ErrorResponse, ErrorResponse.urlIsInvalid)
            XCTAssertNil(data)
            exp.fulfill()
        }

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }
}
