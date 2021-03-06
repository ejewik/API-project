//
//  Movie.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie: Decodable {
    let name: String
    let rightsOwner: String
    let price: Double
    let link: String
    let releaseDate: String
    let poster: String
    
    init(json: JSON) {
    self.name = json["im:name"]["label"].stringValue
        self.rightsOwner = json["rights"]["label"].stringValue
        self.price = Double(json["im:price"]["attributes"]["amount"].stringValue)! //square brackets are numbers
        self.link = json["link"][0]["attributes"]["href"].stringValue
        self.releaseDate = json["im:releaseDate"]["attributes"]["label"].stringValue
        self.poster = json["im:image"][0]["label"].stringValue
        
    }
}
