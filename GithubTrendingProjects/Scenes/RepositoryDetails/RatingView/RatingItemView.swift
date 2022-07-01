//
//  RatingItemView.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//


import UIKit

final class RatingItemView: UIView {

    @IBOutlet private(set) weak var contentView: UIView!
    @IBOutlet private(set) weak var icon: UIImageView!
    @IBOutlet private(set) weak var valueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(RatingItemView.identifier, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }

}

//MARK: - RatingViewContigurable
extension RatingItemView: RatingItemViewContigurable {
    
    func configure(with content: RatingItemViewContent) {
        valueLabel.text = content.title
        icon.image = content.image
    }
    
}
