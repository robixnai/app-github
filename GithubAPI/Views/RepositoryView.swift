//
//  RepositoryView.swift
//  GithubAPI
//
//  Created by Robson Moreira on 31/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import PureLayout

class RepositoryView: UIView {
    
    private var shouldSetupConstraints = true

    let repositoryNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        return label
    }()
    
    let numberStarLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        return label
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        return imageView
    }()
    
    let authorNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        return label
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
            photoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
            photoImageView.autoPinEdge(toSuperviewEdge: .leading)
            
            repositoryNameLabel.autoPinEdge(.right, to: .left, of: photoImageView, withOffset: 6)
            authorNameLabel.autoPinEdge(.right, to: .left, of: photoImageView, withOffset: 6)
            numberStarLabel.autoPinEdge(.right, to: .left, of: photoImageView, withOffset: 6)
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    private func setupView() {
        photoImageView.autoSetDimension(.width, toSize: 40)
        photoImageView.autoSetDimension(.height, toSize: 40)
        addSubview(photoImageView)
        
        addSubview(repositoryNameLabel)
        
        addSubview(authorNameLabel)
        
        addSubview(numberStarLabel)
    }

}
