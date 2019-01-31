//
//  GenericStore.swift
//  GithubAPI
//
//  Created by Robson Moreira on 25/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol GenericStore {
    
    var error: NSError { set get }
    typealias completion<T> = (_ result: T, _ failure: NSError?) -> Void
    
}

class GenericAPIStore {
    
    var error = NSError(domain: "", code: 901, userInfo: [NSLocalizedDescriptionKey: "Erro ao obter as informações"])
    
}
