//
//  Patient.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 10/21/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Patient : User{
    var medicalHistory : String?
    var allergy : String?
    var symptom : String?
    
    required convenience init?(map: Map) {
            self.init()
        }
    
    override func mapping(map: Map){
        id                  <- map["id"]
        roles               <- map["roles"]
        fullName            <- map["fullName"]
        email               <- map["email"]
        dateOfBirth         <- map["dateOfBirth"]
        avatar              <- map["avatar"]
        userName            <- map["userName"]
        phoneNumber         <- map["phoneNumber"]
        medicalHistory      <- map["medical_History"]
        allergy             <- map["allergy"]
        symptom             <- map["symptom"]
    }
}
