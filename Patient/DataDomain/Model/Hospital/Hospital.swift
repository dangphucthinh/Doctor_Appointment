//
//  Hospital.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//

import Foundation
import ObjectMapper
import RealmSwift

class Hospital : Object, Mappable{
    var id : Int?
    var name: String?
    var address: String?
    
    required convenience init?(map: Map) {
            self.init()
        }
    
    func mapping(map: Map) {
        id           <- map["id"]
        name         <- map["name"]
        address      <- map["address"]
    }
}
