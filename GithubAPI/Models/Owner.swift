//
//  Owner.swift
//  GithubAPI
//
//  Created by Robson Moreira on 25/01/19.
//  Copyright © 2019 Robson Moreira. All rights reserved.
//

import Foundation
import ObjectMapper

public class Owner: NSObject, Mappable{
    
    var avatarUrl : String?
    var eventsUrl : String?
    var followersUrl : String?
    var followingUrl : String?
    var gistsUrl : String?
    var gravatarId : String?
    var htmlUrl : String?
    var id : Int?
    var login : String?
    var nodeId : String?
    var organizationsUrl : String?
    var receivedEventsUrl : String?
    var reposUrl : String?
    var siteAdmin : Bool?
    var starredUrl : String?
    var subscriptionsUrl : String?
    var type : String?
    var url : String?
    
    class func newInstance(map: Map) -> Mappable? {
        return Owner()
    }
    
    private override init(){}
    
    public required init?(map: Map) {
        super.init()
    }
    
    public func mapping(map: Map) {
        avatarUrl <- map["avatar_url"]
        eventsUrl <- map["events_url"]
        followersUrl <- map["followers_url"]
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        gravatarId <- map["gravatar_id"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        login <- map["login"]
        nodeId <- map["node_id"]
        organizationsUrl <- map["organizations_url"]
        receivedEventsUrl <- map["received_events_url"]
        reposUrl <- map["repos_url"]
        siteAdmin <- map["site_admin"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- map["subscriptions_url"]
        type <- map["type"]
        url <- map["url"]
    }
    
}
