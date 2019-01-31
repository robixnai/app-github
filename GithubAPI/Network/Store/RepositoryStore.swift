//
//  RepositoryStore.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation

protocol RepositoryStore: GenericStore {
    
    func getRepositories(page: Int, completion: @escaping completion<Repositories?>)

}
