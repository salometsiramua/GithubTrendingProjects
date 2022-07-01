//
//  StartPageViewController.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import UIKit

final class StartPageViewController: UIViewController {

    var viewModel: StartPageViewModel?

    @IBOutlet private(set) weak var welcomeLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var descriptionLabel: UILabel!
    @IBOutlet private(set) weak var enterTheAppButton: UIButton!
    @IBOutlet private(set) weak var hyperlinkedTextView: UITextView!
    @IBOutlet private(set) weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var buttonHeightConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var leadingEdgeConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var upperStack: UIStackView!
    @IBOutlet private(set) weak var lowerStack: UIStackView!

    @IBAction func enterTheAppButtonClickAction(_ sender: UIButton) {
        viewModel?.enterApp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGotoXapoButton()
        setupTitles()
        setupFonts()
        setupColors()
        setupEnterTheAppButton()
        setupHyperlinkedLabel()
        setupConstraints()
    }

    private func setupGotoXapoButton() {
        let barButtonItem = UIBarButtonItem(title: Strings.StartPage.gotoXapoButton.text, style: .plain, target: self, action: #selector(gotoXapoPage))

        barButtonItem.tintColor = .lighterText
        navigationItem.rightBarButtonItem = barButtonItem
    }

    private func setupTitles() {
        welcomeLabel.text = viewModel?.viewData.welcomeText
        subtitleLabel.text = viewModel?.viewData.subtitleText
        descriptionLabel.text = viewModel?.viewData.descriptionText
        enterTheAppButton.setTitle(viewModel?.viewData.enterTheAppButtonTitle, for: .normal)
        hyperlinkedTextView.attributedText = viewModel?.viewData.hyperlinkAttributedString
    }

    private func setupFonts() {
        welcomeLabel.font = .appFont(ofSize: .extraLarge)
        subtitleLabel.font = .appFont(ofSize: .medium)
        descriptionLabel.font = .appFont(ofSize: .medium)
        enterTheAppButton.titleLabel?.font = .appFont(ofSize: .medium)
    }

    private func setupColors() {
        welcomeLabel.textColor = .lighterText
        subtitleLabel.textColor = .lighterText
        descriptionLabel.textColor = .lighterText
        enterTheAppButton.titleLabel?.textColor = .lighterText
        enterTheAppButton.backgroundColor = .xapoOrange
    }

    private func setupEnterTheAppButton() {
        enterTheAppButton.layer.cornerRadius = enterTheAppButton.frame.height / 2
        buttonHeightConstraint.constant = Sizes.buttonHeight.rawValue
    }

    private func setupHyperlinkedLabel() {
        hyperlinkedTextView.backgroundColor = .clear
        hyperlinkedTextView.isUserInteractionEnabled = true
        hyperlinkedTextView.isEditable = false
        hyperlinkedTextView.linkTextAttributes = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        hyperlinkedTextView.textColor = .lighterText
        hyperlinkedTextView.textAlignment = .center

        let fixedWidth = hyperlinkedTextView.frame.size.width
        let newSize = hyperlinkedTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))

        textViewHeightConstraint.constant = newSize.height
    }
    
    private func setupConstraints() {
        leadingEdgeConstraint.constant = Sizes.edgeSpace.rawValue
        upperStack.spacing = Sizes.startPageUpperStackSpacing.rawValue
        lowerStack.spacing = Sizes.startPageLowerStackSpacing.rawValue
    }

    @objc func gotoXapoPage() {
        viewModel?.gotoXapo()
    }
}
