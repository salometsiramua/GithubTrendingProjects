//
//  UIViewController+Extensions.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import Foundation
import UIKit

extension UIViewController {
    class var identifier: String {
        return String(describing: self)
    }
}
