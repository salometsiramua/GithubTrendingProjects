//
//  RatingItemTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RatingItemTests: XCTestCase {

    func testRatingItemViewIBOutlets() {

        let ratingItemView = RatingItemView(frame: .zero)
        XCTAssertNotNil(ratingItemView)
        XCTAssertNotNil(ratingItemView.contentView)
        XCTAssertNotNil(ratingItemView.valueLabel)
        XCTAssertNotNil(ratingItemView.icon)
    }

    func testRatingItemViewLabels() {

        let ratingItemView = RatingItemView(frame: .zero)
        ratingItemView.configure(with: RatingItemViewData(title: "542 Stars", icon: nil))
        XCTAssertEqual(ratingItemView.valueLabel.text, "542 Stars")

    }

    func testRatingViewData() {
        let projectItem = ProjectItem.mock
        let ratingViewData = RatingViewData(content: projectItem)
        XCTAssertEqual(ratingViewData.forksCount, 145)
        XCTAssertEqual(ratingViewData.starsCount, 32)
    }

}
