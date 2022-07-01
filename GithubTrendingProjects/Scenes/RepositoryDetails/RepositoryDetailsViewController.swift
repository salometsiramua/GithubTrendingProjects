//
//  RepositoryDetailsViewController.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {

    var viewModel: RepositoryDetailsViewModel?

    // MARK: - @IBOutlets
    @IBOutlet private(set) weak var repositoryNameLabel: UILabel!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    @IBOutlet private(set) weak var languageLabel: UILabel!
    @IBOutlet private(set) weak var ratingView: RatingView!
    @IBOutlet private(set) weak var openOnGithubButton: UIButton!
    @IBOutlet private(set) weak var usersImageView: UIImageView!
    @IBOutlet private(set) weak var builtByLabel: UILabel!
    @IBOutlet private(set) weak var projectInfoStackView: UIStackView!
    @IBOutlet private(set) weak var ratingViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var stackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var stackViewTrailingConstraint: NSLayoutConstraint!

    // MARK: - @IBActions
    @IBAction func userAvatarClickAction(_ sender: Any) {
        viewModel?.gotoProfile()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFonts()
        setupColors()
        setupData()
        setupConstraints()
        configureRatingView()
        configureOpenOnGithubButton()
        configureUsersView()
    }

    // MARK: - Private functions
    private func setupFonts() {
        repositoryNameLabel.font = .appFont(ofSize: .extraLarge)
        descriptionLabel.font = .appFont(ofSize: .medium)
        languageLabel.font = .appFont(ofSize: .medium)
    }

    private func setupConstraints() {
        projectInfoStackView.spacing = Sizes.projectDetailsStackSpacing.rawValue
        ratingViewHeightConstraint.constant = Sizes.buttonHeight.rawValue
        stackViewLeadingConstraint.constant = Sizes.edgeSpace.rawValue
        stackViewTrailingConstraint.constant = Sizes.edgeSpace.rawValue
    }

    private func setupColors() {
        repositoryNameLabel.textColor = .darkGrayText
        descriptionLabel.textColor = .lighterDarkText
        languageLabel.textColor = viewModel?.languageColor
    }

    private func setupData() {
        guard let viewModel = viewModel else {
            return
        }

        repositoryNameLabel.text = viewModel.repositoryName
        descriptionLabel.text = viewModel.description
        languageLabel.text = viewModel.language
        openOnGithubButton.setTitle(viewModel.openOnGithubText, for: .normal)
        builtByLabel.text = viewModel.builtByText
        viewModel.loadUsersImage(completion: { [weak self] result in
            DispatchQueue.main.async {
                self?.updateImageWithAnimation(result)
            }
        })
    }

    private func configureOpenOnGithubButton() {
        openOnGithubButton.setTitleColor(.lighterText, for: .normal)
        openOnGithubButton.backgroundColor = .xapoOrange
        openOnGithubButton.layer.cornerRadius = openOnGithubButton.frame.height / 2
        openOnGithubButton.addTarget(self, action: #selector(openOnGithubButtonClick), for: .touchUpInside)
    }

    private func configureRatingView() {
        guard let content = viewModel?.ratingViewContent else {
            return
        }
        ratingView.configure(with: content)
    }

    private func configureUsersView() {
        builtByLabel.textColor = .darkGrayText
        builtByLabel.font = .appFont(ofSize: .medium)
        usersImageView.layer.cornerRadius = usersImageView.frame.height / 2
        usersImageView.clipsToBounds = true
        usersImageView.contentMode = .scaleAspectFill
    }

    private func updateImageWithAnimation(_ image: UIImage?) {
        UIView.transition(with: view, duration: 0.325, options: .curveEaseInOut, animations: {
            self.usersImageView.image = image
        })
    }

    @objc private func openOnGithubButtonClick() {
        viewModel?.openOnGithub()
    }

}
