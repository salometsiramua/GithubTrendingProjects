//
//  RepositoryDetailsCoordinator.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 09.05.22.
//

import UIKit

typealias DetailsCoordinator = Coordinator & RepositoryDetailsNavigation

final class RepositoryDetailsCoordinator: NSObject, Coordinator {

    var parentCoordinator: Coordinator?

    var children: [Coordinator] = []

    let navigationController: UINavigationController

    let urlOpener: URLOpener
    let item: ProjectItem
    let imageLoader: ImageLoader

    func start() {
        navigationController.delegate = self
        guard let repositoryDetailsViewController = UIStoryboard.main.instantiateViewController(withIdentifier: RepositoryDetailsViewController.identifier) as? RepositoryDetailsViewController else {
            return
        }

        let repositoryDetailsViewModel = RepositoryDetailsViewModelObject(coordinator: self, projectItem: item, imageLoader: imageLoader)
        repositoryDetailsViewController.viewModel = repositoryDetailsViewModel

        navigationController.pushViewController(repositoryDetailsViewController, animated: true)
    }

    init(navigationController: UINavigationController, urlOpener: URLOpener = URLOpenerService(application: UIApplication.shared), imageLoader: ImageLoader, projectItem: ProjectItem) {
        self.navigationController = navigationController
        self.urlOpener = urlOpener
        self.item = projectItem
        self.imageLoader = imageLoader
    }

}

extension RepositoryDetailsCoordinator: RepositoryDetailsNavigation {

    func openURL(_ url: String) {
        urlOpener.go(to: url, completionHandler: nil)
    }
}

extension RepositoryDetailsCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let repositoryDetailsViewController = fromViewController as? RepositoryDetailsViewController {

            guard let coordinator = repositoryDetailsViewController.viewModel?.coordinator else {
                return
            }
            parentCoordinator?.childDidFinish(coordinator)
        }
    }
}
