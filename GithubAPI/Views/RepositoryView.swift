//
//  RepositoryView.swift
//  GithubAPI
//
//  Created by Robson Moreira on 31/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import PureLayout

class RepositoryView: BaseView {
    
    private var shouldSetupConstraints = true
    
    private let repositoryLabelNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Repositório:"
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.image = #imageLiteral(resourceName: "baseline_star_rate_black")
        imageView.contentMode = .center
        return imageView
    }()

    let repositoryNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        return label
    }()
    
    let amountStarLabel: UILabel = {
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
            photoImageView.autoAlignAxis(toSuperviewAxis: .vertical)
            
            repositoryLabelNameLabel.autoPinEdge(.top, to: .bottom, of: photoImageView, withOffset: 2)
            repositoryLabelNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
            
            repositoryNameLabel.autoPinEdge(.top, to: .bottom, of: repositoryLabelNameLabel, withOffset: 0)
            repositoryNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
            
            authorNameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            authorNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 8)
            
            amountStarLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 8)
            amountStarLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
            
            starImageView.autoPinEdge(.right, to: .left, of: amountStarLabel, withOffset: -2)
            starImageView.autoPinEdge(.top, to: .top, of: amountStarLabel, withOffset: 0)
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.cornerRadius = 12.0
        self.layer.masksToBounds = true
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
        photoImageView.autoSetDimension(.width, toSize: (UIScreen.main.bounds.width - 38.0))
        photoImageView.autoSetDimension(.height, toSize: 380)
        addSubview(photoImageView)
        
        addSubview(repositoryLabelNameLabel)
        
        addSubview(repositoryNameLabel)
        
        addSubview(authorNameLabel)
        
        starImageView.autoSetDimension(.width, toSize: 20)
        starImageView.autoSetDimension(.height, toSize: 20)
        addSubview(starImageView)
        
        addSubview(amountStarLabel)
    }

}
