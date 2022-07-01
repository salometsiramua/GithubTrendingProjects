//
//  StartPageViewModel.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation
import UIKit

protocol StartPageViewModel {
    var viewData: StartPageViewData { get }
    func enterApp()
    func gotoXapo()
}

final class StartPageViewModelObject: StartPageViewModel {

    lazy var viewData: StartPageViewData = StartPageViewData(
        hyperlinkAttributedString: hyperlinkString,
        welcomeText: Strings.StartPage.welcomeLabel.text,
        subtitleText: Strings.StartPage.subtitleLabel.text,
        descriptionText: Strings.StartPage.descriptionLabel.text,
        enterTheAppButtonTitle: Strings.StartPage.enterTheAppButton.text)

    weak var coordinator: StartCoordinator?

    var hyperlinkString: NSAttributedString = {
        let text = "\(Strings.StartPage.firstHyperlink.text) \(Strings.StartPage.and.text) \(Strings.StartPage.secondHyperlink.text)"
        let attributedString = NSMutableAttributedString(string: text)
        let firstHyperlinkEndpointURL = URL(string: Strings.StartPage.firstHyperlinkEndpoint.text)
        let secondHyperlinkEndpointURL = URL(string: Strings.StartPage.secondHyperlinkEndpoint.text)

        if let firstRange = text.nsRange(from: text.range(of: Strings.StartPage.firstHyperlink.text)) {
            attributedString.setAttributes([.link: firstHyperlinkEndpointURL as Any], range: firstRange)
        }

        if let secondRange = text.nsRange(from: text.range(of: Strings.StartPage.secondHyperlink.text)) {
            attributedString.setAttributes([.link: secondHyperlinkEndpointURL as Any], range: secondRange)
        }
        return attributedString
    }()

    init(coordinator: StartCoordinator) {
        self.coordinator = coordinator
    }

    func enterApp() {
        coordinator?.enterApp()
    }

    func gotoXapo() {
        coordinator?.openURL(Strings.StartPage.xapoHomePageEndoint.text)
    }
}
