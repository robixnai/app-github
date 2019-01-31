//
//  ViewController.swift
//  GithubAPI
//
//  Created by Robson Moreira on 25/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class RepositoriesViewController: BaseViewController<RepositoriesView>, UICollectionViewDataSource, UISearchResultsUpdating {
    
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
        
        customView.repositoriesSearchController.searchResultsUpdater = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = customView.repositoriesSearchController
        
        customView.repositoriesCollectionView.dataSource = self
        customView.repositoriesCollectionView.refreshControl = customView.repositoriesRefreshControl
        customView.repositoriesCollectionView.beginInfiniteScroll(true)
        customView.repositoriesCollectionView.addInfiniteScroll { (collectionView) in
            collectionView.performBatchUpdates({ () -> Void in
                print("\(self.viewModel?.currentPage ?? 1)")
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
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        myCell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return myCell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("Pesquisou: \(searchController.searchBar.text ?? "")")
    }

}

extension RepositoriesViewController: RepositoriesDataProviderProtocol {
    
    func success(viewModel: Any) {
        self.viewModel = viewModel as? RepositoriesViewModel
        self.customView.repositoriesCollectionView.reloadData()
        
        self.customView.repositoriesRefreshControl.endRefreshing()
        self.customView.repositoriesCollectionView.reloadData()
    }
    
    func errorData(_ provider: GenericDataProvider?, error: NSError) {
        self.showError(title: "Alerta", message: "Erro na API. Tente novamente mais tarde!", description: "", error: error)
    }
    
}
