//
//  ImageLoaderServiceTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 09.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class ImageLoaderServiceTests: XCTestCase {

    func initImageLoader() -> ImageLoaderService {
        let cache = NSCache<NSString, UIImage>()
        cache.setObject(UIImage(), forKey: NSString(string: "image1"))
        cache.setObject(UIImage(), forKey: NSString(string: "image2"))
        cache.setObject(UIImage(), forKey: NSString(string: "image3"))
        cache.setObject(UIImage(), forKey: NSString(string: "image4"))

        return ImageLoaderService(imagesCache: cache, session: URLSession.shared)
    }

    func testImageLoader() {
        let loader = initImageLoader()
        loader.getImage(for: "image1") { result in
            switch result {
            case .success(let image):
                XCTAssertNotNil(image)
            case .failure(_):
                XCTFail()
            }
        }
    }

    func testImageLoaderForError() {
        let loader = initImageLoader()

        let exp = expectation(description: "Resume task called")

        loader.getImage(for: "image7") { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                exp.fulfill()
                XCTAssertNotNil(error)
            }
        }

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }
}
