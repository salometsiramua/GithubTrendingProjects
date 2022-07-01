//
//  RatingItemViewContigurable.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//


import UIKit

protocol RatingItemViewContent {
    var title: String { get }
    var image: UIImage? { get }
}

protocol RatingItemViewContigurable {
    func configure(with content: RatingItemViewContent)
}

struct RatingItemViewData: RatingItemViewContent {
    
    let title: String
    let image: UIImage?
    
    init(title: String, icon: UIImage?) {
        self.title = title
        self.image = icon
    }
}
