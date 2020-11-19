//
//  RegisterResponse.swift
//  youMed
//
//  Created by thinhdang on 11/15/20.
//

import Foundation
import ObjectMapper

class ResponseMessages : Mappable{
    var succeeded : Bool?
   // var error = Array<String>()
    required init(map: Map) {

    }

    func  mapping(map: Map) {
        succeeded  <- map["succeeded"]
       // error      <- map["errors"]
    }
}

class RegisterResponse : Mappable{
    var succeeded: ResponseMessages?
    //var token: Token?
    var error = Array<String>()

    required init?(map : Map) {
        
    }

    func mapping(map: Map){
        succeeded  <- map["succeeded"]
        //user   <- map["user"]
        error      <- map["errors"]
    }
}
