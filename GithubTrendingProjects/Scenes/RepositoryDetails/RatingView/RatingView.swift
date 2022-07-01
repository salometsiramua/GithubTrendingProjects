//
//  RatingView.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import UIKit

final class RatingView: UIView {

    @IBOutlet private(set) weak var contentView: UIView!
    
    @IBOutlet private(set) weak var starsView: RatingItemView!
    @IBOutlet private(set) weak var forksView: RatingItemView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(RatingView.identifier, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        setupViews()
    }
    
    private func setupViews() {
        contentView.layer.borderColor = UIColor.border.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 4
    }

}

//MARK: - RatingViewContigurable
extension RatingView: RatingViewContigurable {
    
    func configure(with content: RatingViewContent) {
        
        starsView.configure(with: RatingItemViewData(title: "\(content.starsCount.description) \(Strings.RepositoryDetails.stars.text)", icon: UIImage(systemName: "star.fill")))
        
        forksView.configure(with: RatingItemViewData(title: "\(content.forksCount.description) \(Strings.RepositoryDetails.forks.text)", icon: UIImage(systemName: "arrow.branch")))
        
    }
    
}
