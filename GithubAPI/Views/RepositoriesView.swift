//
//  RepositoriesView.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import PureLayout

class RepositoriesView: BaseView {
    
    private var shouldSetupConstraints = true
    
    let repositoriesSearchController: UISearchController = {
        return UISearchController(searchResultsController: nil)
    }()
    
    let repositoriesRefreshControl: UIRefreshControl = {
        return UIRefreshControl()
    }()

    let repositoriesCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 20.0, right: 20.0)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 40.0), height: 466)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(RepositoryCollectionViewCell.self, forCellWithReuseIdentifier: "RepositoryCollectionViewCell")
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        collectionView.isHidden = true
        return collectionView
    }()
    
    let repositoriesLoadingLoadingView: LoadingView = {
        let loadingView = LoadingView(frame: CGRect.zero)
        loadingView.startAnimating()
        return loadingView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            repositoriesCollectionView.autoPinEdge(toSuperviewEdge: .leading)
            repositoriesCollectionView.autoPinEdge(toSuperviewEdge: .trailing)
            repositoriesCollectionView.autoPinEdge(toSuperviewEdge: .top)
            repositoriesCollectionView.autoPinEdge(toSuperviewEdge: .bottom)
            
            repositoriesLoadingLoadingView.autoAlignAxis(toSuperviewAxis: .vertical)
            repositoriesLoadingLoadingView.autoAlignAxis(toSuperviewAxis: .horizontal)

            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    private func setupView() {
        repositoriesLoadingLoadingView.autoSetDimension(.width, toSize: UIScreen.main.bounds.width)
        repositoriesLoadingLoadingView.autoSetDimension(.height, toSize: UIScreen.main.bounds.height)
        addSubview(repositoriesLoadingLoadingView)
        
        repositoriesRefreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        addSubview(repositoriesCollectionView)
    }
    
    @objc private func refreshData(_ sender: Any) {
        (delegate as! RepositoriesViewController).refreshRepositories(sender)
    }

}
