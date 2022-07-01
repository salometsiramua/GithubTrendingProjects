//
//  UIColor+Extensions.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 04.05.22.
//

import UIKit.UIColor

extension UIColor {

    class var grayBackground: UIColor {
        return UIColor(named: "Gray Background Color") ?? UIColor.darkGray
    }

    class var lighterText: UIColor {
        return UIColor(named: "Light Text Color") ?? UIColor.white
    }

    class var darkGrayText: UIColor {
        return UIColor(named: "Dark Text Color") ?? UIColor.black
    }

    class var xapoOrange: UIColor {
        return UIColor(named: "Xapo Orange Color") ?? UIColor.white
    }

    class var border: UIColor {
        return UIColor(named: "Border Color") ?? UIColor.lightGray
    }

    class var lighterDarkText: UIColor {
        return UIColor(named: "Lighter Dark Text Color") ?? UIColor.lightGray
    }

    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") { cString.removeFirst() }

        if cString.count != 6 {
            self.init("ff0000")
            return
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }

}

