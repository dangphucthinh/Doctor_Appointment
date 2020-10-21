//
//  Response.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/15/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class ResponseMessages : Mappable{
    var succeeded : String?
    
    required init(map: Map) {
        
    }
    
    func  mapping(map: Map) {
        succeeded  <- map["succeeded"]
    }
}
