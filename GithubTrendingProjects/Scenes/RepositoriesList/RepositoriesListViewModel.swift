//
//  RepositoriesListViewModel.swift
//  GithubTrendingProjects
//
//  Created by Salome Tsiramua on 02.05.22.
//

import Foundation

protocol RepositoriesListViewModel {
    var coordinator: RepositoriesCoordinator? { get }
    var listItemsCount: Int { get }
    var isUserInteractionEnabledOnSearchBar: Bool { get }
    func loadList()
    func listItem(at index: Int) -> ProjectItem
    func didSelectItem(at index: Int)
    func search(for text: String)
}

protocol ListChangeDelegate: AnyObject {
    func listDidUpdate(withAnimation: Bool)
    func errorTextDidChange(_ text: String?, canReload: Bool)
}

final class RepositoriesListViewModelObject: RepositoriesListViewModel {

    private var list: [ProjectItem] = []
    private var filteredList: [ProjectItem] = []
    private var isFiltered = false
    private var errorLabel: String = ""

    private(set) var isUserInteractionEnabledOnSearchBar: Bool = false

    weak var delegate: ListChangeDelegate?

    var listItemsCount: Int {
        isFiltered ? filteredList.count : list.count
    }

    weak var coordinator: RepositoriesCoordinator?

    let networkService: RepositoriesFetcherService
    let imageLoader: ImageLoader

    init(coordinator: RepositoriesCoordinator, networkService: RepositoriesFetcherService = RepositoriesNetworkServiceObject(session: URLSession.shared), imageLoader: ImageLoader) {
        self.coordinator = coordinator
        self.networkService = networkService
        self.imageLoader = imageLoader
    }

    func loadList() {
        networkService.loadList { [weak self] result in
            switch result {
            case .success(let response):
                guard let self = self else { return }
                let responseList = response.repositoryContent.map { ProjectItem(from: $0)}
                self.list = self.sortedList(from: responseList)
                self.delegate?.listDidUpdate(withAnimation: true)
                self.delegate?.errorTextDidChange(nil, canReload: false)
                self.isUserInteractionEnabledOnSearchBar = true
            case .failure(let error):
                let errorText = (error as? ErrorResponse)?.description
                self?.delegate?.errorTextDidChange(errorText, canReload: true)
                self?.isUserInteractionEnabledOnSearchBar = false
            }
        }
    }

    func listItem(at index: Int) -> ProjectItem {
        isFiltered ? filteredList[index] : list[index]
    }

    func didSelectItem(at index: Int) {
        coordinator?.openRepositoryDetails(for: listItem(at: index), imageLoader: imageLoader)
    }

    func search(for text: String) {
        delegate?.errorTextDidChange(nil, canReload: false)

        guard !text.isEmpty else {
            isFiltered = false
            delegate?.listDidUpdate(withAnimation: false)
            return
        }

        isFiltered = true

        filteredList = list.filter({ projectItem in
            projectItem.contains(text: text)
        })

        delegate?.listDidUpdate(withAnimation: false)

        guard filteredList.isEmpty else {
            return
        }

        delegate?.errorTextDidChange(String(format: Strings.RepositoriesList.searchResultIsEmpty.rawValue, text), canReload: false)
    }

    private func sortedList(from list: [ProjectItem]) -> [ProjectItem]{
        return list.sorted { $0.rank < $1.rank }
    }
}
