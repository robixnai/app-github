//
//  License.swift
//  GithubAPI
//
//  Created by Robson Moreira on 28/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import UIKit
import ObjectMapper

class License: NSObject, Mappable{
    
    var key : String?
    var name : String?
    var nodeId : String?
    var spdxId : String?
    var url : String?
    
    
    class func newInstance(map: Map) -> Mappable? {
        return License()
    }
    
    private override init() {}
    
    public required init?(map: Map) {
        super.init()
    }
    
    public func mapping(map: Map) {
        key <- map["key"]
        name <- map["name"]
        nodeId <- map["node_id"]
        spdxId <- map["spdx_id"]
        url <- map["url"]
    }
    
}
