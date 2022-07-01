//
//  URLOpener.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 04.05.22.
//

import Foundation
import UIKit

protocol ApplicationService {
    func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler completion: ((Bool) -> Void)?)
}

protocol URLOpener {
    func go(to url: String, completionHandler completion: ((Bool) -> Void)?)
}

final class URLOpenerService: URLOpener {

    let application: ApplicationService

    init(application: ApplicationService = UIApplication.shared) {
        self.application = application
    }

    func go(to url: String, completionHandler completion: ((Bool) -> Void)? = nil) {
        guard let url = URL(string: url) else {
            return
        }
        application.open(url, options: [:], completionHandler: completion)
    }
}

extension UIApplication: ApplicationService { }
