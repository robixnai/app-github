//
//  RepositoryAPIStore.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class RepositoryAPIStore: GenericAPIStore, RepositoryStore {
    
    private let perPage: Int = 10
    
    func getRepositories(page: Int, completion: @escaping (Repositories?, NSError?) -> Void) {
        do {
            let urlRequest = try RepositoryRouter.allRepository(perPage: perPage, page: page).asURLRequest()
            if let url = urlRequest {
                Alamofire.request(url, method: .get).responseJSON(completionHandler: { (response) in
                    guard let responseLoad = response.response else {
                        completion(nil, response.error as NSError?)
                        return
                    }
                    switch responseLoad.statusCode {
                    case 200:
                        guard let json = response.result.value as? [String: Any] else {
                            completion(nil, self.error)
                            return
                        }
                        let result = Mapper<Repositories>().map(JSON: json)
                        completion(result, nil)
                        break
                    default:
                        completion(nil, response.error as NSError?)
                    }
                })
            }
        } catch let error as NSError {
            completion(nil, error)
        }
    }

}
