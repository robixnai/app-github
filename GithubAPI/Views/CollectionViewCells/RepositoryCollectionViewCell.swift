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
        customView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        customView.layer.cornerRadius = 12.0
        customView.layer.masksToBounds = true
        
        customView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        customView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
        self.customView.photoImageView.image = nil
        viewModel?.downloadImage(completion: { (image, error) in
            self.customView.photoImageView.image = image
        })
        customView.repositoryNameLabel.text = viewModel?.repositoryName
        customView.amountStarLabel.text = String(viewModel?.amountStar ?? 0)
        customView.authorNameLabel.text = viewModel?.authorName
    }
    
}
