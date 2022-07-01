//
//  RepositoryDetailsViewControllerTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class RepositoryDetailsViewControllerTests: XCTestCase {

    private func createViewController(with model: RepositoryDetailsViewModelMock) -> RepositoryDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: RepositoryDetailsViewController.identifier) as! RepositoryDetailsViewController

        vc.viewModel = model
        UIWindow().addSubview(vc.view)
        return vc
    }

    func testRepositoryDetailsViewControllerInit() {
        let exp = expectation(description: "Go to profile action called")
        let viewModelMock = RepositoryDetailsViewModelMock()
        viewModelMock.gotoProfileCallback = {
            exp.fulfill()
        }
        let viewController = createViewController(with: viewModelMock)
        viewController.userAvatarClickAction(UIButton())

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }
}

class RepositoryDetailsViewModelMock: RepositoryDetailsViewModel {
    var openOnGithubText: String = "Open on github"

    var builtByText: String = "built by"

    var coordinator: DetailsCoordinator?

    var ratingViewContent: RatingViewContent = RatingViewContentMock()

    var repositoryName: String = "Repository test name"

    var description: String? = "Repository description"

    var language: String? = "Swift"

    var languageColor: UIColor? = .xapoOrange

    var url: String = "imageURL.png"

    var usersUrl: String? = "github.com/2345"

    var openOnGithubCallback: (()->())?
    var gotoProfileCallback: (()->())?

    func loadUsersImage(completion: @escaping ((UIImage?) -> Void)) {

    }

    func openOnGithub() {
        openOnGithubCallback?()
    }

    func gotoProfile() {
        gotoProfileCallback?()
    }


}
