//
//  ResponseUser.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 10/21/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseUser: Object, Mappable {
    var status: Int?
    var message: String?
    var data: Patient?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["message"]
        data        <- map["data"]
    }

}
