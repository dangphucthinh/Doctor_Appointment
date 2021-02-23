//
//  MessageDataModel.swift
//  youMed
//
//  Created by thinhdang on 11/15/20.
//

import UIKit

class MessageDataModel{
    
    let message : String
    let recieverId : String
    let senderId : String
    
    init(msg : String, rvrId : String, sndrId : String) {
        self.message = msg
        self.recieverId = rvrId
        self.senderId = sndrId
    }
    
    func toDictionary() -> Any{
        return ["message":message, "recieverId": recieverId, "senderId": senderId] as Any
    }
}
