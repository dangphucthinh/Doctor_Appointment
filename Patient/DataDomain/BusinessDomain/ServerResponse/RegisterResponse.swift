//
//  RegisterResponse.swift
//  youMed
//
//  Created by thinhdang on 11/15/20.
//

import Foundation
import ObjectMapper

class ResponseMessages : Mappable{
    var succeeded : String?

    required init(map: Map) {

    }

    func  mapping(map: Map) {
        succeeded  <- map["succeeded"]
    }
}

class RegisterResponse : Mappable{
    var succeeded: ResponseMessages?
    //var token: Token?

    required init?(map : Map) {
        
    }

    func mapping(map: Map){
        succeeded  <- map["succeeded"]
        //user   <- map["user"]
    }
}
