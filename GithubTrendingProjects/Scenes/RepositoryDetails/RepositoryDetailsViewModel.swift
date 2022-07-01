//
//  RepositoryDetailsViewModel.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation
import UIKit

protocol RepositoryDetailsViewModel {

    var coordinator: DetailsCoordinator? { get }
    var ratingViewContent: RatingViewContent { get }
    var repositoryName: String { get }
    var description: String? { get }
    var language: String? { get }
    var languageColor: UIColor? { get }
    var url: String { get }
    var openOnGithubText: String { get }
    var builtByText: String { get }
    var usersUrl: String? { get }

    func loadUsersImage(completion: @escaping ((UIImage?) -> Void))
    func openOnGithub()
    func gotoProfile()
}

final class RepositoryDetailsViewModelObject: RepositoryDetailsViewModel {

    //MARK: - Computed properties for viewController
    var ratingViewContent: RatingViewContent {
        RatingViewData(content: projectItem)
    }

    var repositoryName: String {
        "\(projectItem.projectName)/\(projectItem.username)"
    }

    var description: String? {
        projectItem.projectDescription
    }

    var language: String? {
        projectItem.language
    }

    var languageColor: UIColor? {
        projectItem.languageColor
    }

    var url: String {
        projectItem.url
    }

    var openOnGithubText: String {
        Strings.RepositoryDetails.openOnGithub.text
    }

    var builtByText: String {
        Strings.RepositoryDetails.builtBy.text
    }
    
    var usersUrl: String? {
        projectItem.builtBy?.first?.url
    }


    weak var coordinator: DetailsCoordinator?
    let projectItem: ProjectItem

    private let imageLoader: ImageLoader

    init(coordinator: DetailsCoordinator,
         projectItem: ProjectItem,
         urlOpener: URLOpener = URLOpenerService(application: UIApplication.shared),
         imageLoader: ImageLoader) {
        self.coordinator = coordinator
        self.projectItem = projectItem
        self.imageLoader = imageLoader
    }

    func openOnGithub() {
        coordinator?.openURL(url)
    }

    func loadUsersImage(completion: @escaping ((UIImage?) -> Void)) {
        guard let avatarURL = projectItem.builtBy?.first?.avatar else { return }
        imageLoader.getImage(for: avatarURL) { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure:
                completion(UIImage(named: "defaultAvatar") ?? nil)
            }
        }
    }

    func gotoProfile() {
        guard let userProfileUrl = projectItem.builtBy?.first?.url else {
            return
        }
        coordinator?.openURL(userProfileUrl)
    }

}
