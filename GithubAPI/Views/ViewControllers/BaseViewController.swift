//
//  BaseViewController.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit

class BaseViewController<BaseView: UIView>: UIViewController, ErrorHandleable {

    var customView: BaseView {
        return view as! BaseView
    }
    
    override func loadView() {
        view = BaseView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
    }

}
