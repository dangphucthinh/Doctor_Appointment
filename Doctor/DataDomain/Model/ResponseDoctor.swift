//
//  ResponseDoctor.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseDoctor: Object, Mappable {
    var status: Int?
    var message: String?
    var data = List<Doctor>()
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["message"]
        data        <- (map["data"], ListTransform<Doctor>())
    }

}
