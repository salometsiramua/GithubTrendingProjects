//
//  UITableView+Extensions.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 10.05.22.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cellForRowAt indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }

    func register<T: UITableViewCell>(cellClass: T.Type) {
        register(UINib(nibName: cellClass.identifier, bundle: nil), forCellReuseIdentifier: cellClass.identifier)
    }

    func reloadWithAnimation() {
        reloadData()
        var delayCounter = 0
        visibleCells.forEach { cell in
            cell.transform = CGAffineTransform(translationX: 0, y: bounds.size.height/2)
            cell.alpha = 0

            UIView.animate(withDuration: 0.5, delay: 0.05 * Double(delayCounter), options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
            }, completion: nil)
            delayCounter += 1
        }
    }
}
