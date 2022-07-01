//
//  UIColor+Tests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//
import XCTest
@testable import GithubTrendingProjects

class UIColorTests: XCTestCase {

    func testColors() {
        
        XCTAssertEqual(UIColor.grayBackground, UIColor(named: "Gray Background Color"))
        XCTAssertEqual(UIColor.lighterDarkText, UIColor(named: "Lighter Dark Text Color"))
        XCTAssertEqual(UIColor.border, UIColor(named: "Border Color"))
        XCTAssertEqual(UIColor.xapoOrange, UIColor(named: "Xapo Orange Color"))
        XCTAssertEqual(UIColor.lighterText, UIColor(named: "Light Text Color"))
        XCTAssertEqual(UIColor.darkGrayText, UIColor(named: "Dark Text Color"))
    }

    func testInvalidHexColor() {
        XCTAssertEqual(UIColor.red, UIColor("FF"))
    }

    func testRedColorFromHex() {
        XCTAssertEqual(UIColor.red, UIColor("#FF0000"))
    }

    func testBlueFromHex() {
        XCTAssertEqual(UIColor.blue, UIColor("#0000FF"))
    }
}
