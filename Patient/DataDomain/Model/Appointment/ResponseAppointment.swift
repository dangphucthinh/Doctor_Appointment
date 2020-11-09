//
//  ResponseAppointment.swift
//  youMed
//
//  Created by thinhdang on 11/8/20.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseAppointment: Object, Mappable {
    var status: Int?
    var message: String?
    var data: Appointment?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["message"]
        data        <- map["data"]
    }

}
