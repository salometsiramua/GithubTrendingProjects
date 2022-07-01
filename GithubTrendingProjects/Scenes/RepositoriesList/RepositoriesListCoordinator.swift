//
//  RepositoriesListCoordinator.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 09.05.22.
//

import Foundation
import UIKit

typealias RepositoriesCoordinator = Coordinator & RepositoriesListNavigation

final class RepositoriesListCoordinator: NSObject, Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    let imageLoader: ImageLoader

    func start() {
        navigationController.delegate = self
        guard let repositoriesListViewController = UIStoryboard.main.instantiateViewController(withIdentifier: RepositoriesListViewController.identifier) as? RepositoriesListViewController else {
            return
        }

        let repositoriesListViewModel = RepositoriesListViewModelObject(coordinator: self, imageLoader: imageLoader)
        repositoriesListViewController.viewModel = repositoriesListViewModel
        repositoriesListViewModel.delegate = repositoriesListViewController
        navigationController.pushViewController(repositoriesListViewController, animated: true)
    }

    init(navigationController: UINavigationController, imageLoader: ImageLoader) {
        self.navigationController = navigationController
        self.imageLoader = imageLoader
    }
}

extension RepositoriesListCoordinator: RepositoriesListNavigation {
    func openRepositoryDetails(for item: ProjectItem, imageLoader: ImageLoader) {
        let coordinator = RepositoryDetailsCoordinator(navigationController: navigationController, urlOpener: URLOpenerService(application: UIApplication.shared), imageLoader: imageLoader, projectItem: item)
        coordinator.start()
        coordinator.parentCoordinator = self
        children.append(coordinator)
    }
}

extension RepositoriesListCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let repositoriesListViewController = fromViewController as? RepositoriesListViewController {

            guard let coordinator = repositoriesListViewController.viewModel?.coordinator else {
                return
            }
            parentCoordinator?.childDidFinish(coordinator)
        }
    }
}
