//
//  ResponseListHopital.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//

import Foundation
import ObjectMapper
import RealmSwift

class ResponseListHospital : Object, Mappable{
    var status: Int?
    var message: String?
    var data = List<Hospital>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map){
        status      <- map["status"]
        message     <- map["message"]
        data        <- (map["data"], ListTransform<Hospital>())
    }
}
