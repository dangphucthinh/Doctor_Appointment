//
//  RegisterResponse.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/15/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper

class RegisterResponse : Mappable{
    var succeeded: ResponseMessages?
    //var token: Token?

    required init?(map : Map) {
        
    }

    func mapping(map: Map){
        succeeded  <- map["succeeded"]
        //user   <- map["user"]
    }
}
