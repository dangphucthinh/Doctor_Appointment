//
//  Token.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper

class Token: Mappable {
    var tokenType: String?
    var expiresIn: Int?
    var accessToken: String?
    var refreshToken: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
    }
}
