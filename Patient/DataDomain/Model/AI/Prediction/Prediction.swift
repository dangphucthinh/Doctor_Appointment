//
//  Prediction.swift
//  youMed
//
//  Created by thinhdang on 11/11/20.
//

import Foundation
import ObjectMapper
import RealmSwift

class Prediction : Object, Mappable{
    var disease: String?
    var spec = Array<String>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map){
        disease    <- map["disease"]
        spec       <- map["spec"]
    }
}


