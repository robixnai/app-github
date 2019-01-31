//
//  GenericDataProvider.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation

protocol GenericDataProvider: class {
    
    func success(viewModel: Any)
    func errorData(_ provider: GenericDataProvider?, error: NSError)
    
}

class DataProviderManager<T, S> {
    
    var delegate: T?
    var viewModel: S?
    
}

