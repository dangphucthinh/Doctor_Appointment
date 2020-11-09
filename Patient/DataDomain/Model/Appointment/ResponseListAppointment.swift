//
//  ResponseListAppointment.swift
//  youMed
//
//  Created by thinhdang on 11/8/20.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseListAppointment: Object, Mappable {
    var status: Int?
    var message: String?
    var data = List<Appointment>()
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["message"]
        data        <- (map["data"], ListTransform<Appointment>())
    }

}
