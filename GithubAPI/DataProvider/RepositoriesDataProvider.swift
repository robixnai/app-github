//
//  RepositoriesDataProvider.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation

protocol RepositoriesDataProviderProtocol: GenericDataProvider {}

class RepositoriesDataProviderManeger: DataProviderManager <RepositoriesDataProviderProtocol, RepositoriesViewModel> {
    
    func getRepositories(page: Int) {
        RepositoryAPIStore().getRepositories(page: page) { (repositories, error) in
            if error == nil {
                if let repositoriesLoad = repositories, let repositoryList = repositoriesLoad.items {
                    if self.viewModel == nil {
                        self.viewModel = RepositoriesViewModel(repositoryList: repositoryList)
                    } else {
                        self.viewModel?.updateViewModel(repositoryList: repositoryList)
                    }
                    if let vm = self.viewModel {
                        self.delegate?.success(viewModel: vm)
                    }
                }
            } else {
                self.delegate?.errorData(self.delegate, error: error!)
            }
        }
    }
    
}
