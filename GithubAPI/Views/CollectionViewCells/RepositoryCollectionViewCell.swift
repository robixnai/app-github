//
//  RepositoryCollectionViewCell.swift
//  GithubAPI
//
//  Created by Robson Moreira on 29/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit

class RepositoryCollectionViewCell: UICollectionViewCell {
    
    private var customView: RepositoryView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customView = RepositoryView(frame: CGRect.zero)
        contentView.addSubview(customView)
        
        customView.autoPinEdge(toSuperviewEdge: .leading)
        customView.autoPinEdge(toSuperviewEdge: .trailing)
        customView.autoPinEdge(toSuperviewEdge: .top)
        customView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    func setupCollectionViewCell(viewModel: RepositoryViewModel?) {
        customView.photoImageView.image = nil
        viewModel?.downloadImage(completion: { (image, error) in
            self.customView.photoImageView.image = image
        })
        customView.repositoryNameLabel.text = viewModel?.repositoryName
        customView.amountStarLabel.text = String(viewModel?.amountStar ?? 0)
        customView.authorNameLabel.text = viewModel?.authorName
    }
    
}
