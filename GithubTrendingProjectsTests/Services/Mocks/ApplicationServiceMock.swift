//
//  ApplicationServiceMock.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 09.05.22.
//

import UIKit
@testable import GithubTrendingProjects

class ApplicatoinServiceMock: ApplicationService {

    private let success: Bool

    init(success: Bool = true) {
        self.success = success
    }

    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?) {
        completion?(success)
    }
}
