//
//  Room.swift
//  youMed
//
//  Created by Oscar on 11/12/20.
//

import Foundation

struct Room {
    var roomId:String?
    var name:String?
    var ownerId:String?
    
    

    init(array: [String: Any]){
        if let roomName = array["name"] as? String, let ownerIdx = array["creatorId"] as? String{
            self.name = roomName
            self.ownerId = ownerIdx
        }
    }
}
