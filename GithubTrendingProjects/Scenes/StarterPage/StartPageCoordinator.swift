//
//  StartPageCoordinator.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 09.05.22.
//

import UIKit

typealias StartCoordinator = Coordinator & StartPageNavigation

final class StartPageCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    let navigationController: UINavigationController
    let urlOpener: URLOpener
    let imageLoader: ImageLoader

    func start() {
        guard let startViewController = UIStoryboard.main.instantiateViewController(withIdentifier: StartPageViewController.identifier) as? StartPageViewController else {
            return
        }
        let startViewModel = StartPageViewModelObject(coordinator: self)
        startViewController.viewModel = startViewModel

        navigationController.pushViewController(startViewController, animated: true)
    }

    init(navigationController: UINavigationController, urlOpener: URLOpener = URLOpenerService(application: UIApplication.shared), imageLoader: ImageLoader = ImageLoaderService(session: URLSession.shared)) {
        self.urlOpener = urlOpener
        self.navigationController = navigationController
        self.imageLoader = imageLoader
    }

}

extension StartPageCoordinator: StartPageNavigation {

    func openURL(_ url: String) {
        urlOpener.go(to: url, completionHandler: nil)
    }

    func enterApp() {
        let coordinator = RepositoriesListCoordinator(navigationController: navigationController, imageLoader: imageLoader)
        coordinator.parentCoordinator = self
        coordinator.start()
        children.append(coordinator)
    }
}
