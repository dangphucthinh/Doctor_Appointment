//
//  ResponseDoctor.swift
//  Doctor_Appointment
//
//  Created by Oscar on 11/9/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseDoctor: Object, Mappable {
    var status: Int?
    var message: String?
    var data : Doctor?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["message"]
        data        <- map["data"]
    }

}
