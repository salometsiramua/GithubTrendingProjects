//
//  UIFont+Extensions.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 04.05.22.
//

import UIKit.UIFont

extension UIFont {
    class func appFont(ofSize: FontSize) -> UIFont {
        return .boldSystemFont(ofSize: ofSize.rawValue)
    }
}

enum FontSize: CGFloat {
    case small = 14
    case medium = 16
    case large = 18
    case extraLarge = 30
}


