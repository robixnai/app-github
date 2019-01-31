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
    
    func setupCollectionViewCell(viewModel: FormCellViewModel?) {
        customView.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.4901960784, blue: 0.5803921569, alpha: 1)
        customView.iconImage = viewModel?.formRecordImage
        customView.titleText = viewModel?.formRecordTitle
        customView.subTitleText = viewModel?.formRecordSubTitle
        customView.textColor = #colorLiteral(red: 0.568627451, green: 0.6745098039, blue: 0.7333333333, alpha: 1)
        
        customView.updateConstraint(withOffset: viewModel?.formConstantCenterTitle ?? 0)
    }
    
}
