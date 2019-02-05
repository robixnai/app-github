//
//  LoadingView.swift
//  GithubAPI
//
//  Created by Robson Moreira on 04/02/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import PureLayout

class LoadingView: UIView {
    
    private var shouldSetupConstraints = true
    
    private let loadingLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Loading"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let loadingActivityIndicator: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .gray)
        return activityIndicatorView
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
            loadingActivityIndicator.autoAlignAxis(toSuperviewAxis: .vertical)
            loadingActivityIndicator.autoAlignAxis(toSuperviewAxis: .horizontal)
            
            loadingLabel.autoPinEdge(.top, to: .bottom, of: loadingActivityIndicator)
            loadingLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    private func setupView() {
        addSubview(loadingLabel)
        addSubview(loadingActivityIndicator)
    }
    
    func startAnimating() {
        loadingLabel.isHidden = false
        loadingActivityIndicator.isHidden = false
        loadingActivityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        loadingLabel.isHidden = true
        loadingActivityIndicator.isHidden = true
        loadingActivityIndicator.startAnimating()
    }
    
}
