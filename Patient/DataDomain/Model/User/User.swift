//
//  User.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
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
    var phoneNumber: String?
    var avatar: String?
    var firstName : String?
    var lastName: String?
    
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
        firstName   <- map["firstName"]
        lastName    <- map["lastName"]     
    }
}
