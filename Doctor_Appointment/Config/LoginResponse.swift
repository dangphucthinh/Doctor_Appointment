//
//  LoginResponse.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/12/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse: Mappable {
    var user: NSObject?
    var auth: NSObject?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        auth <- map["auth"]
    }
}
