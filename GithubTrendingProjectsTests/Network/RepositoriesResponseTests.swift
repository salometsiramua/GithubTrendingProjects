//
//  RepositoriesResponseTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoriesResponseTests: XCTestCase {

    func testRepositoriesResponse() {
        do {
            let responseJson = """
            [{
            "rank": 13,
            "username": "papers-we-love",
            "repositoryName": "papers-we-love",
            "url": "https://github.com/papers-we-love/papers-we-love",
            "description": "Papers from the computer science community to read and discuss.",
            "language": "Shell",
            "languageColor": "#89e051",
            "totalStars": 59838,
            "forks": 4754,
            "starsSince": 260,
            "since": "daily",
            "builtBy": [
            {
            "username": "zeeshanlakhani",
            "url": "https://github.com/zeeshanlakhani",
            "avatar": "https://avatars.githubusercontent.com/u/202820?s=40&v=4"
            },
            {
            "username": "DarrenN",
            "url": "https://github.com/DarrenN",
            "avatar": "https://avatars.githubusercontent.com/u/215030?s=40&v=4"
            },
            {
            "username": "jeremyheiler",
            "url": "https://github.com/jeremyheiler",
            "avatar": "https://avatars.githubusercontent.com/u/183600?s=40&v=4"
            },
            {
            "username": "newsomc",
            "url": "https://github.com/newsomc",
            "avatar": "https://avatars.githubusercontent.com/u/79253?s=40&v=4"
            },
            {
            "username": "bowmanb",
            "url": "https://github.com/bowmanb",
            "avatar": "https://avatars.githubusercontent.com/u/420078?s=40&v=4"
            }
            ]
            }]
            
            """
            
            guard let data = responseJson.data(using: .utf8) else {
                XCTFail()
                return
            }
            
            let repositories = try RepositoriesResponse(data: data)
            XCTAssertNotNil(repositories)
            XCTAssertEqual(repositories.repositoryContent.count, 1)
            XCTAssertEqual(repositories.repositoryContent.first?.username, "papers-we-love")
            
        } catch {
            XCTFail()
        }
    }

    func testRepositoriesResponseWithUsernameMissing() {
        do {
            let responseJson = """
                        [{
                        "rank": 13,
                        "repositoryName": "papers-we-love",
                        "url": "https://github.com/papers-we-love/papers-we-love",
                        "description": "Papers from the computer science community to read and discuss.",
                        "language": "Shell",
                        "languageColor": "#89e051",
                        "totalStars": 59838,
                        "forks": 4754,
                        "starsSince": 260,
                        "since": "daily",
                        "builtBy": [
                        {
                        "username": "zeeshanlakhani",
                        "url": "https://github.com/zeeshanlakhani",
                        "avatar": "https://avatars.githubusercontent.com/u/202820?s=40&v=4"
                        },
                        {
                        "username": "DarrenN",
                        "url": "https://github.com/DarrenN",
                        "avatar": "https://avatars.githubusercontent.com/u/215030?s=40&v=4"
                        },
                        {
                        "username": "jeremyheiler",
                        "url": "https://github.com/jeremyheiler",
                        "avatar": "https://avatars.githubusercontent.com/u/183600?s=40&v=4"
                        },
                        {
                        "username": "newsomc",
                        "url": "https://github.com/newsomc",
                        "avatar": "https://avatars.githubusercontent.com/u/79253?s=40&v=4"
                        },
                        {
                        "username": "bowmanb",
                        "url": "https://github.com/bowmanb",
                        "avatar": "https://avatars.githubusercontent.com/u/420078?s=40&v=4"
                        }
                        ]
                        }]
            
            """
            
            guard let data = responseJson.data(using: .utf8) else {
                XCTFail()
                return
            }
            
            _ = try RepositoriesResponse(data: data)
            XCTFail("Shouldn't create object without username")
        } catch {
            
        }
    }
}
