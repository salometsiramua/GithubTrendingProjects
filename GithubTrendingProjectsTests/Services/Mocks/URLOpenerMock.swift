//
//  URLOpenerMock.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 09.05.22.
//

import Foundation
@testable import GithubTrendingProjects

class URLOpenerMock: URLOpener {

    let success: Bool
    var handler: (()->())?
    init(success: Bool) {
        self.success = success
    }

    func go(to url: String, completionHandler completion: ((Bool) -> Void)? = nil) {
        handler?()
        completion?(success)

    }
}
