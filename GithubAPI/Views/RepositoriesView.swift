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
        layout.sectionInset = UIEdgeInsets()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 400)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.alwaysBounceVertical = true
        
        collectionView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return collectionView
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

            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    private func setupView() {
        repositoriesRefreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        addSubview(repositoriesCollectionView)
    }
    
    @objc private func refreshData(_ sender: Any) {
        (delegate as! RepositoriesViewController).refreshRepositories(sender)
    }

}
