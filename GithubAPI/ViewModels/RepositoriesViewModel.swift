//
//  RepositoryViewModel.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation

class RepositoriesViewModel {
    
    typealias completion<T> = (_ result: T, _ failure: NSError?) -> Void
    
    private var page: Int = 1
    private var repositoryList: [Repository]?
    private var currentRepository: Repository?
    
    init (repositoryList: [Repository]) {
        self.repositoryList = repositoryList
    }
    
    var currentPage: Int? {
        page += 1
        return page
    }
    
    var countOfRepositories: Int? {
        return repositoryList?.count
    }
    
}
