//
//  ViewController.swift
//  GithubAPI
//
//  Created by Robson Moreira on 25/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class RepositoriesViewController: BaseViewController<RepositoriesView>, UICollectionViewDataSource, UICollectionViewDelegate, UISearchResultsUpdating {
    
    var dataProvider: RepositoriesDataProviderManeger?
    var viewModel: RepositoriesViewModel?
    
    override func loadView() {
        super.loadView()
        customView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Github"
        definesPresentationContext = true
        
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.searchController = customView.repositoriesSearchController
        
        customView.repositoriesSearchController.searchResultsUpdater = self
        
        customView.repositoriesCollectionView.dataSource = self
        customView.repositoriesCollectionView.delegate = self
        customView.repositoriesCollectionView.refreshControl = customView.repositoriesRefreshControl
        customView.repositoriesCollectionView.addInfiniteScroll { (collectionView) in
            collectionView.performBatchUpdates({ () -> Void in
                self.dataProvider?.getRepositories(page: self.viewModel?.currentPage ?? 1)
            }, completion: { (finished) -> Void in
                collectionView.finishInfiniteScroll()
            });
        }
        
        dataProvider = RepositoriesDataProviderManeger()
        dataProvider?.delegate = self
        dataProvider?.getRepositories(page: 1)
    }
    
    func refreshRepositories(_ sender: Any) {
        self.dataProvider?.getRepositories(page: 1)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.countOfRepositories ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let repositoryCellView = collectionView.dequeueReusableCell(withReuseIdentifier: "RepositoryCollectionViewCell", for: indexPath) as? RepositoryCollectionViewCell
        
        let cellViewModel = viewModel?.setupCellViewModel(index: indexPath.row)
        repositoryCellView?.setupCollectionViewCell(viewModel: cellViewModel)
        
        return repositoryCellView ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.setupCurrentRepository(index: indexPath.row)
        guard let url = URL(string: viewModel?.repositoryUrl ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        viewModel?.searchRepository(search: searchController.searchBar.text)
        customView.repositoriesCollectionView.reloadData()
    }

}

extension RepositoriesViewController: RepositoriesDataProviderProtocol {
    
    func success(viewModel: Any) {
        self.customView.repositoriesLoadingLoadingView.stopAnimating()
        
        self.viewModel = viewModel as? RepositoriesViewModel
        
        self.customView.repositoriesRefreshControl.endRefreshing()
        
        self.customView.repositoriesCollectionView.isHidden = false
        self.customView.repositoriesCollectionView.reloadData()
    }
    
    func errorData(_ provider: GenericDataProvider?, error: NSError) {
        self.showError(title: "Alerta", message: "Erro na API. Tente novamente mais tarde!", description: "", error: error)
        
        self.customView.repositoriesLoadingLoadingView.stopAnimating()
        
        self.customView.repositoriesRefreshControl.endRefreshing()
        
        self.customView.repositoriesCollectionView.isHidden = false
    }
    
}
