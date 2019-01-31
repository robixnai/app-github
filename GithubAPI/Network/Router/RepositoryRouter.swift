//
//  RepositoryRouter.swift
//  GithubAPI
//
//  Created by Robson Moreira on 25/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation

enum RepositoryRouter {
    
    case allRepository(perPage: Int, page: Int)
    
    func asURLRequest() throws -> URL? {
        switch self {
        case .allRepository(let perPage, let page):
            guard var urlComponents = URLComponents(string: API.baseURL) else {return nil}
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: "language:swift"),
                URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "per_page", value: String(perPage)),
                URLQueryItem(name: "page", value: String(page))
            ]
            return urlComponents.url
        }
    }
    
}
