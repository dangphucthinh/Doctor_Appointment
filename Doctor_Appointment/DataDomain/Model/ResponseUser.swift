//
//  ResponseUser.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/21/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseUser: Object, Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var data: User?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }

}

class Datas: Object, Mappable {
    
    var user : User?
   // var list = List<Movie>()

    required convenience init?(map: Map) {
        self.init()
    }
    
   func mapping(map: Map) {
    user        <- map["user"]
      // list           <- (map["lists"], ListTransform<Movie>())
      
   }
}
