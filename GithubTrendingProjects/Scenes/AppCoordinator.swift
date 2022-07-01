//
//  AppCoordinator.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import UIKit

// MARK: - App coordinator for controlling all the flow for the application
final class AppCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    let navigationController: UINavigationController
    let urlOpener: URLOpener

    init(navigationController : UINavigationController, urlOpener: URLOpener = URLOpenerService(application: UIApplication.shared)) {
        self.navigationController = navigationController
        self.urlOpener = urlOpener
    }

    func start() {
        presentStartPage()
    }

    private(set) lazy var startPageCoordinator: StartPageCoordinator = StartPageCoordinator(navigationController: navigationController)

    func presentStartPage() {
        startPageCoordinator.start()
        startPageCoordinator.parentCoordinator = self
        children.append(startPageCoordinator)
    }
}
