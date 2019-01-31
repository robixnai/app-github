//
//  AppDelegate.swift
//  GithubAPI
//
//  Created by Robson Moreira on 25/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder {

    var window: UIWindow?

}

extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: RepositoriesViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
}
