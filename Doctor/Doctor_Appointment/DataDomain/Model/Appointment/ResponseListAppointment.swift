//
//  ResponseListAppointment.swift
//  Doctor_Appointment
//
//  Created by Oscar on 11/6/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
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
