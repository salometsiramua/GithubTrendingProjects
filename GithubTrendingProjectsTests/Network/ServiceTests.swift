//
//  ServiceTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class ServiceTests: XCTestCase {

    func testBaseUrlNotEqual() {
        let baseURL = Service.repositories.baseUrl
        XCTAssertNotEqual(baseURL.absoluteString, Strings.Service.dummyEndoint.rawValue)
    }

    func testBaseUrlEqual() {
        let baseURL = Service.repositories.baseUrl
        XCTAssertEqual(baseURL.absoluteString, Strings.Service.endpoint.rawValue)
    }

    func testRepositoriesPath() {
        XCTAssertEqual(Service.repositories.path, Strings.Service.repositoriesPath.rawValue)
    }
    
    func testRepositoriesHttpMethod() {
        let repositories = Service.repositories
        XCTAssertEqual(repositories.httpMethod, .get)
    }

}
