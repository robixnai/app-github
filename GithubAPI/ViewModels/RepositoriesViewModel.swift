//
//  RepositoryViewModel.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation

class RepositoriesViewModel {
    
    private var page: Int = 1
    private var currentRepository: Repository?
    private var repositoryList: [Repository]?
    private var repositoryListSearch: [Repository]?
    
    init (repositoryList: [Repository]) {
        page += 1
        self.repositoryList = repositoryList
    }
    
    var currentPage: Int? {
        return page
    }
    
    var countOfRepositories: Int? {
        return repositoryList?.count
    }
    
    var repositoryUrl: String? {
        return currentRepository?.htmlUrl
    }
    
    func updateViewModel(repositoryList: [Repository]) {
        page += 1
        _ = repositoryList.filter { (repository) -> Bool in
            self.repositoryList?.append(repository)
            return true
        }
    }
    
    func setupCurrentRepository(index: Int) {
        currentRepository = self.repositoryList?[index]
    }
    
    func setupCellViewModel(index: Int) -> RepositoryViewModel {
        if let repository = self.repositoryList?[index] {
            return RepositoryViewModel(repository: repository)
        }
        return RepositoryViewModel()
    }
    
    func searchRepository(search: String?) {
        guard let text = search else {return}
        
        if text.count > 0 {
            if repositoryListSearch == nil {
                repositoryListSearch = repositoryList
            }
            
            repositoryList = repositoryListSearch?.filter({ (repository) -> Bool in
                let repositoryTmp: Repository = repository as Repository
                
                let repositoryName: NSString = repositoryTmp.name! as NSString
                let rangeRepositoryName = repositoryName.range(of: text, options: .caseInsensitive)
                
                return rangeRepositoryName.location != NSNotFound
            })
        } else if repositoryListSearch != nil {
            repositoryList = repositoryListSearch
            repositoryListSearch = nil
        }
    }
    
}
