//
//  Strings.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 04.05.22.
//

import Foundation

struct Strings {
    enum Service: String {
        case endpoint = "https://gh-trending-api.herokuapp.com/"
        case dummyEndoint = "https://github.com/"
        case repositoriesPath = "repositories"
    }
    
    enum StartPage: String {
        case gotoXapoButton = "Go to Xapo"
        case welcomeLabel = "Welcome to iOS Test"
        case subtitleLabel = "iOS Test for Xapo bank"
        case descriptionLabel = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna"
        case enterTheAppButton = "Enter the app"
        case and = "and"
        case firstHyperlink = "Privacy policy"
        case secondHyperlink = "Terms of use"
        case firstHyperlinkEndpoint = "https://static.xapo.com/terms/privacy-policy.html"
        case secondHyperlinkEndpoint = "https://static.xapo.com/terms/index.html"
        case xapoHomePageEndoint = "https://www.xapo.com/"

        var text: String {
            self.rawValue
        }
    }

    enum RepositoriesList: String {
        case searchResultIsEmpty = "No repositories found for \"%@\""
        case reloadButton = "Reload"
    }

    enum RepositoryDetails: String {
        case stars = "Stars"
        case forks = "Forks"
        case openOnGithub = "Open on github"
        case builtBy = "Built by:"

        var text: String {
            self.rawValue
        }
    }
}
