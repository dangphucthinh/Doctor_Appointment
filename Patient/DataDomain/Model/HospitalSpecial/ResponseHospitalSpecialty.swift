//
//  ResponseHospitalSpecialty.swift
//  youMed
//
//  Created by thinhdang on 12/10/20.
//

import UIKit
import RealmSwift
import ObjectMapper

class ResponseHospitalSpecialty: Object, Mappable {
    var status: Int?
    var message: String?
    var data = List<HospitalSpecialty>()
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        status      <- map["status"]
        message     <- map["message"]
        data        <- (map["data"], ListTransform<HospitalSpecialty>())
    }

}
