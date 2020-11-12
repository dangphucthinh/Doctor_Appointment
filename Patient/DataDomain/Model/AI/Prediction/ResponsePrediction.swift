//
//  Prediction.swift
//  youMed
//
//  Created by thinhdang on 11/11/20.
//

import Foundation
import ObjectMapper
import RealmSwift

class ResponsePrediction : Object,Mappable{
    var status: Int?
    var message : String?
    var data : Prediction?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map){
        status    <- map["status"]
        message   <- map["message"]
        data      <- map["data"]
    }
}
