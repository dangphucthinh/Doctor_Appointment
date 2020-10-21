//
//  Doctor.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/21/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


class Doctor: User{
    var certification : String?
    var education : String?
    var specialtyName : String?
    var hospitalSpecialty_Name : String?
    
    
    
    required convenience init?(map: Map) {
            self.init()
        }
    
    override func mapping(map: Map) {
        id          <- map["id"]
        roles       <- map["roles"]
        fullName    <- map["fullName"]
        email       <- map["email"]
        dateOfBirth <- map["dateOfBirth"]
        avatar      <- map["avatar"]
        userName    <- map["userName"]
        phoneNumber <- map["phoneNumber"]
        education   <- map["education"]
        specialtyName <- map["specialtyName"]
        hospitalSpecialty_Name  <- map["hospitalSpecialty_Name"]
        
    }
}
