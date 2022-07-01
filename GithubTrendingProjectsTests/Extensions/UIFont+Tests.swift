//
//  UIFont+Tests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 09.05.22.
//

import Foundation

import XCTest
@testable import GithubTrendingProjects

class UIFontTests: XCTestCase {

    func testFontSize() {

        XCTAssertEqual(.boldSystemFont(ofSize: 14), UIFont.appFont(ofSize: .small))
        XCTAssertEqual(.boldSystemFont(ofSize: 16), UIFont.appFont(ofSize: .medium))
        XCTAssertEqual(.boldSystemFont(ofSize: 18), UIFont.appFont(ofSize: .large))
        XCTAssertEqual(.boldSystemFont(ofSize: 30), UIFont.appFont(ofSize: .extraLarge))
    }

    func testFontSizesEnumValues() {
        XCTAssertEqual(FontSize.extraLarge.rawValue, 30)
    }
}
