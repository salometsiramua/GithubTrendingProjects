//
//  StartPageViewControllerTests.swift
//  GithubTrendingProjectsTests
//
//  Created by Salome Tsiramua on 10.05.22.
//

import XCTest
@testable import GithubTrendingProjects

class StartPageViewControllerTests: XCTestCase {

    private func makeViewController(enterTheAppCallback: (()->())?, gotoXapoCallback: (()->())?) -> StartPageViewController {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! StartPageViewController
        vc.viewModel = StartPageViewModelMock(enterTheAppCallback: enterTheAppCallback, gotoXapoCallback: gotoXapoCallback)
        UIWindow().addSubview(vc.view)
        return vc

    }

    func testStartPageViewContollerConstraints() {
        let viewController = makeViewController(enterTheAppCallback: nil, gotoXapoCallback: nil)
        XCTAssertEqual(viewController.upperStack.spacing, Sizes.startPageUpperStackSpacing.rawValue)
        XCTAssertEqual(viewController.lowerStack.spacing, Sizes.startPageLowerStackSpacing.rawValue)
    }

    func testStartPageEnterTheAppButtonAction() {
        let exp = expectation(description: "Enter the app action called")
        let viewController = makeViewController(enterTheAppCallback: {
            exp.fulfill()
        }, gotoXapoCallback: nil)

        viewController.enterTheAppButtonClickAction(UIButton())

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testStartPageGotoXapoActionCalled() {
        let exp = expectation(description: "Goto xapo action called")
        let viewController = makeViewController(enterTheAppCallback: nil, gotoXapoCallback: {
            exp.fulfill()
        })

        viewController.gotoXapoPage()

        waitForExpectations(timeout: 0.5) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }

    func testTextColorSetting() {
        let viewController = makeViewController(enterTheAppCallback: nil, gotoXapoCallback: nil)
        XCTAssertEqual(viewController.hyperlinkedTextView.textColor, .lighterText)
        XCTAssertEqual(viewController.enterTheAppButton.titleColor(for: .normal), .lighterText)
        XCTAssertEqual(viewController.enterTheAppButton.backgroundColor, .xapoOrange)
    }

}

class StartPageViewModelMock: StartPageViewModel {
    var viewData = StartPageViewData(hyperlinkAttributedString: NSAttributedString(), welcomeText: "", subtitleText: "", descriptionText: "", enterTheAppButtonTitle: "")

    var enterTheAppCallback: (()->())?
    var gotoXapoCallback: (()->())?

    init(enterTheAppCallback: (()->())?, gotoXapoCallback: (()->())?) {
        self.enterTheAppCallback = enterTheAppCallback
        self.gotoXapoCallback = gotoXapoCallback
    }

    func enterApp() {
        enterTheAppCallback?()
    }

    func gotoXapo() {
        gotoXapoCallback?()
    }
}
