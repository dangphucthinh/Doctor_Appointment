//
//  Room.swift
//  youMed
//
//  Created by Oscar on 11/12/20.
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
