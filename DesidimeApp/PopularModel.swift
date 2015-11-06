//
//  TopPopularDealsModel.swift
//  DesidimeApp
//
//  Created by Sanjay Mali on 05/11/15.
//  Copyright © 2015 TickledMedia. All rights reserved.
//

import Foundation
import SwiftyJSON
class PopularModel {
    
    let id:Int!
    var title:String!
    var off_percent:String!
    var current_price:NSNumber!
    var original_price:NSNumber!
    var comments_count:Int!
    var image:String!
    var score:Int!
    var created_at:NSNumber!
    var vote_value:Int!
    var merchant_name:String!
    required init(json:JSON){
        self.id = json["id"].int
        self.title = json["title"].string
        self.off_percent = json["off_percent"].string
        self.comments_count = json["comments_count"].int
        self.original_price = json["original_price"].number
        self.current_price = json["current_price"].number
        self.image = json["image"].string
        self.score = json["score"].int
        self.created_at = json["created_at"].number
        self.vote_value = json["vote_value"].int
        self.merchant_name = json["merchant","name"].string
        
    }
    
}