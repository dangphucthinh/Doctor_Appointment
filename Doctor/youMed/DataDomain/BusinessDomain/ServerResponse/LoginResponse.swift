//
//  LoginResponse.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class LoginResponse : Object, Mappable{
    var user: User?
    var token: Token?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map){
        token  <- map["token"]
        user   <- map["user"]
    }
    
}
