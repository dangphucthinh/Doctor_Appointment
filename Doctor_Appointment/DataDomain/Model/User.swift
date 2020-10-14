//
//  User.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper

class User:Mappable {
    var id: String?
    var roles: Array<String>?
    var fullName: String?
    var userName: String?
    var email: String?
    var dateOfBirth: String?
    var avatar: String?
    var phoneNumber: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        roles       <- map["roles"]
        fullName    <- map["fullName"]
        email       <- map["email"]
        dateOfBirth <- map["dateOfBirth"]
        avatar      <- map["avatar"]
        userName    <- map["userName"]
        phoneNumber <- map["phoneNumber"]
    }
}
