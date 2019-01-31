//
//  Extensions.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func configNavigation() {
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.black
        self.navigationBar.barTintColor = UIColor.black
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}

public protocol ErrorHandleable {
    
    func showError(title: String, message: String, description: String, error: Error?)
    
}

extension ErrorHandleable where Self: UIViewController {
    
    func showError(title: String = "Alerta!", message:String = "Erro no sistema", description: String = "Erro Genérico", error: Error? = nil) {
        ErrorAlert.shared.showErrorAlert(title, message: message, onController: self)
    }
    
}
