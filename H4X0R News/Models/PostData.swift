//
//  PostData.swift
//  H4X0R News
//
//  Created by Dayton on 09/07/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import Foundation

struct Result:Decodable {
    let hits: [Post]
}


//allow our list to recognize the order of the post object based on id property
struct Post:Decodable, Identifiable {
    var id:String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}


