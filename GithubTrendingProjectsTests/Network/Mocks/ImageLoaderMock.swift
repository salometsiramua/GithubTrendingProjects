//
//  ImageLoaderMock.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 06.05.22.
//

import UIKit

@testable import GithubTrendingProjects

class ImageLoaderMock: ImageLoader {
    
    private let success: Bool

    init(success: Bool = true) {
        self.success = success
    }

    func getImage(for url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard success else {
            return completion(.failure(ErrorResponse.urlIsInvalid))
        }

        completion(.success(UIImage()))
    }
}
