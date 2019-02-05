//
//  RepositoryViewModel.swift
//  GithubAPI
//
//  Created by Robson Moreira on 01/02/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class RepositoryViewModel {
    
    typealias completion<T> = (_ result: T, _ failure: NSError?) -> Void
    
    private var repository: Repository?
    private var repositoryPhoto: UIImage?
    private var arrayCacheImage: [AutoPurgingImageCache?]?
    
    init() {}
    
    init (repository: Repository) {
        self.repository = repository
        self.arrayCacheImage = []
    }
    
    var id: Int? {
        return repository?.id
    }
    
    var photo: UIImage? {
        return repositoryPhoto
    }
    
    var repositoryName: String? {
        return repository?.name
    }
    
    var amountStar: Int? {
        return repository?.stargazersCount
    }
    
    var authorName: String? {
        return repository?.owner?.login
    }
    
    func downloadImage(completion: @escaping completion<UIImage?>) {
        guard let id = id else {return}
        let url = URL(string: repository?.owner?.avatarUrl ?? "")
        
        for cacheImageLoad in arrayCacheImage! {
            if let cacheImageLoad = cacheImageLoad?.image(withIdentifier: String(id)) {
                completion(cacheImageLoad, nil)
                return
            }
        }
        
        Alamofire.request(url!).responseImage { (response) in
            if let image = response.result.value {
                let cacheImage = AutoPurgingImageCache()
                self.arrayCacheImage?.append(cacheImage)
                completion(image, nil)
            }
        }
    }
    
}
