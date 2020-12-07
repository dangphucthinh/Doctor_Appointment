//
//  Doctor.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
//

import Foundation
import ObjectMapper
import RealmSwift

class Doctor:Object, Mappable {
    var id: String?
    var roles: Array<String>?
    var fullName: String?
    var userName: String?
    var email: String?
    var dateOfBirth: String?
    var phoneNumber: String?
    var avatar: String?
    var certification : String?
    var education : String?
    var specialtyName : String?
    var hospitalSpecialty_Name : String?
    var bio : String?
    var hospital_Name : String?
    
    required convenience init?(map: Map) {
            self.init()
        }
    
    func mapping(map: Map) {
        id                      <- map["id"]
        roles                   <- map["roles"]
        fullName                <- map["fullName"]
        email                   <- map["email"]
        dateOfBirth             <- map["dateOfBirth"]
        avatar                  <- map["avatar"]
        userName                <- map["userName"]
        phoneNumber             <- map["phoneNumber"]
        education               <- map["education"]
        specialtyName           <- map["specialtyName"]
        hospitalSpecialty_Name  <- map["hospitalSpecialty_Name"]
        certification           <- map["certification"]
        bio                     <- map["bio"]
        hospital_Name                 <- map["hospital_Name"]
    }
}
