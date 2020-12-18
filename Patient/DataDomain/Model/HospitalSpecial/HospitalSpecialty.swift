//
//  HospitalSpecial.swift
//  youMed
//
//  Created by thinhdang on 12/10/20.
//

import Foundation
import ObjectMapper
import RealmSwift

class HospitalSpecialty : Object, Mappable{
    var id: Int?
    var name: String?
    var hosSpecImg: String?
    
    required convenience init?(map: Map) {
            self.init()
        }
    
    func mapping(map: Map){
        id          <- map["id"]
        name        <- map["name"]
        hosSpecImg  <- map["hosSpecImg"]
    }
}
