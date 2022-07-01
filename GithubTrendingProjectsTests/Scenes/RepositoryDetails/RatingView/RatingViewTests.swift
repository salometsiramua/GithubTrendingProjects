//
//  RatingViewTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

struct RatingViewContentMock: RatingViewContent {
    var starsCount: Int = 12
    var forksCount: Int = 32
}

class RatingViewTests: XCTestCase {

    func testRatingViewOutlets() {

        let ratingView = RatingView(frame: .zero)
        XCTAssertNotNil(ratingView)
        XCTAssertNotNil(ratingView.contentView)
        XCTAssertNotNil(ratingView.forksView)
        XCTAssertNotNil(ratingView.starsView)
    }

    func testRatingViewLabelUpdated() {

        let ratingView = RatingView(frame: .zero)

        let data = RatingViewContentMock()
        ratingView.configure(with: data)

        XCTAssertEqual(ratingView.forksView.valueLabel.text, "32 Forks")
        XCTAssertEqual(ratingView.starsView.valueLabel.text, "12 Stars")
    }

    func testRatingViewData() {

        let data = RatingItemViewData(title: "23 Stars", icon: UIImage())
        XCTAssertEqual(data.title, "23 Stars")

    }

}
