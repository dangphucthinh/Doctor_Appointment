//
//  LoginResponse.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse : Mappable{
    var user: User?
    var token: Token?
    
    required init?(map : Map) {
        
    }
    
    func mapping(map: Map){
        token  <- map["token"]
    }
    
}
