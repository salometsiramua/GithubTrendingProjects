//
//  RatingViewContigurable.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import Foundation

protocol RatingViewContent {
    var starsCount: Int { get }
    var forksCount: Int { get }
}

protocol RatingViewContigurable {
    func configure(with content: RatingViewContent)
}

struct RatingViewData: RatingViewContent, Equatable {
    
    let starsCount: Int
    let forksCount: Int
    
    init(content: ProjectItem) {
        starsCount = content.totalStars
        forksCount = content.forks
    }
    
}
