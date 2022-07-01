//
//  ProjectItemCell.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 03.05.22.
//

import UIKit

protocol ProjectItemCellConfigurable {

    func configure(with model: ProjectItem)
}

final class ProjectItemCell: UITableViewCell {

    @IBOutlet private(set) weak var projectName: UILabel!
    @IBOutlet private(set) weak var projectStarsCount: UILabel!
    @IBOutlet private(set) weak var projectDescription: UILabel!
    @IBOutlet private(set) weak var projectLanguage: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    private func setupUI() {
        projectName.textColor = .darkGrayText
        projectDescription.textColor = .darkGrayText
        projectStarsCount.textColor = .xapoOrange

        projectName.font = .appFont(ofSize: .large)
        projectDescription.font = .appFont(ofSize: .medium)
        projectStarsCount.font = .appFont(ofSize: .small)
        projectLanguage.font = .appFont(ofSize: .small)
    }

}

extension ProjectItemCell: ProjectItemCellConfigurable {

    func configure(with model: ProjectItem) {
        projectName.text = model.projectName
        projectDescription.text = model.projectDescription
        projectStarsCount.text = model.projectTotalStars
        projectLanguage.text = model.language
        projectLanguage.textColor = model.languageColor
    }
}

