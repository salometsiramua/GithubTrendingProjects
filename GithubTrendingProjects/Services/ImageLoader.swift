//
//  ImageLoader.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 05.05.22.
//

import Foundation
import UIKit

protocol ImageLoader {
    func getImage(for url: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

final class ImageLoaderService: ImageLoader {

    private let session: NetworkSession
    private let imagesCache: NSCache<NSString, UIImage>

    init(imagesCache: NSCache<NSString, UIImage> = NSCache<NSString, UIImage>(), session: NetworkSession = URLSession.shared) {
        self.session = session
        self.imagesCache = imagesCache
    }

    func getImage(for url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let image = getImage(for: url) {
            return completion(.success(image))
        }

        guard Reachability.isConnectedToNetwork else {
            return completion(.failure(ErrorResponse.noInternetConnection))
        }

        guard let urlPath = URL(string: url) else {
            return completion(.failure(ErrorResponse.urlIsInvalid))
        }

        self.getData(from: urlPath) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(ErrorResponse.responseDataIsNil))
            }

            guard let image = UIImage(data: data) else {
                return completion(.failure(ErrorResponse.responseDataIsNil))
            }

            self?.setImage(image: image, for: url)
            completion(.success(image))
        }

        return
    }

    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        session.loadData(from: url, completionHandler: completion)
    }

    private func getImage(for key: String) -> UIImage? {
        imagesCache.object(forKey: NSString(string: key))
    }

    private func setImage(image: UIImage, for key: String) {
        imagesCache.setObject(image, forKey: NSString(string: key))
    }

}
