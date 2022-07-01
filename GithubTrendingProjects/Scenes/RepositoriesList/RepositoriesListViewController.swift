//
//  RepositoriesListViewController.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import UIKit

final class RepositoriesListViewController: UIViewController {

    var viewModel: RepositoriesListViewModel?

    @IBOutlet private(set) weak var listTableView: UITableView!
    @IBOutlet private(set) weak var searchBar: UISearchBar!
    @IBOutlet private(set) weak var errorLabel: UILabel!
    @IBOutlet private(set) weak var reloadButton: UIButton!
    
    private lazy var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigationBar()
        setupSearchBar()
        showSpinner()
        setupReloadButton()

        viewModel?.loadList()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .darkGrayText
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    private func setupReloadButton() {
        reloadButton.isHidden = true
        reloadButton.backgroundColor = .xapoOrange
        reloadButton.setTitleColor(.lighterText, for: .normal)
        reloadButton.setTitle(Strings.RepositoriesList.reloadButton.rawValue, for: .normal)
        reloadButton.heightAnchor.constraint(equalToConstant: Sizes.buttonHeight.rawValue).isActive = true
        reloadButton.translatesAutoresizingMaskIntoConstraints = false
        reloadButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Sizes.edgeSpace.rawValue).isActive = true
        reloadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Sizes.edgeSpace.rawValue).isActive = true
        reloadButton.addTarget(self, action: #selector(reloadButtonAction), for: .touchUpInside)
        reloadButton.layer.cornerRadius = Sizes.buttonHeight.rawValue / 2
        reloadButton.titleLabel?.font = .appFont(ofSize: .medium)
    }

    @objc private func reloadButtonAction() {
        viewModel?.loadList()
    }

    private func setupSearchBar() {
        searchBar.barTintColor = UIColor.white
        searchBar.setBackgroundImage(UIImage.init(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        searchBar.tintColor = .xapoOrange
        searchBar.delegate = self
    }

    private func setupTableView() {
        listTableView.register(cellClass: ProjectItemCell.self)
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.tableHeaderView = UIView()
    }

    private func showSpinner() {
        listTableView.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: listTableView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: listTableView.centerYAnchor).isActive = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
    }
}

extension RepositoriesListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.listItemsCount ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProjectItemCell = tableView.dequeue(cellForRowAt: indexPath)
        guard let model = viewModel?.listItem(at: indexPath.row) else {
            return cell
        }

        cell.configure(with: model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectItem(at: indexPath.row)

        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension RepositoriesListViewController: UITableViewDelegate { }

extension RepositoriesListViewController: ListChangeDelegate {

    func errorTextDidChange(_ text: String?, canReload: Bool) {
        DispatchQueue.main.async {
            self.spinner.removeFromSuperview()
            self.errorLabel.text = text
            self.reloadButton.isHidden = !canReload
            self.searchBar.isUserInteractionEnabled = self.viewModel?.isUserInteractionEnabledOnSearchBar ?? false
        }
    }

    func listDidUpdate(withAnimation: Bool) {
        DispatchQueue.main.async {
            if withAnimation {
                self.listTableView.reloadWithAnimation()
            } else {
                self.listTableView.reloadData()
            }
            self.spinner.removeFromSuperview()
            self.reloadButton.isHidden = true
        }
    }
}

extension RepositoriesListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.search(for: searchText)
    }
}
