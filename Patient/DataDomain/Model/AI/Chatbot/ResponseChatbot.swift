//
//  ResponseChatbot.swift
//  youMed
//
//  Created by Oscar on 11/10/20.
//

import Foundation
import RealmSwift
import ObjectMapper

class ResponseChatbot : Object, Mappable{
    var idUser : String?
    var status : Int?
    var message : String?
    var data : String?
    
    required convenience init?(map: Map) {
            self.init()
        }
    
    func mapping(map: Map)  {
        status   <-  map["status"]
        message  <-  map["message"]
        data     <-  map["data"]
    }
}
