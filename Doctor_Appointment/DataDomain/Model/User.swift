//
//  User.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class User:Object, Mappable {
    var id: String?
    var roles: Array<String>?
    var fullName: String?
    var userName: String?
    var email: String?
    var dateOfBirth: String?
    var avatar: String?
    var phoneNumber: String?
    var firstName: String?
    var lastName: String?
    var gender: Bool?
    
    required convenience init?(map: Map) {
            self.init()
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
