//
//  Result.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit
import ObjectMapper

class Repositories: NSObject, Mappable {
    
    var incompleteResults : Bool?
    var items : [Repository]?
    var totalCount : Int?
    
    class func newInstance(map: Map) -> Mappable? {
        return Repositories()
    }
    
    private override init() {}
    
    public required init?(map: Map){}
    
    public func mapping(map: Map) {
        incompleteResults <- map["incomplete_results"]
        items <- map["items"]
        totalCount <- map["total_count"]
    }
    
}
