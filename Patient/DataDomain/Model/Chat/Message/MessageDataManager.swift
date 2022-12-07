//
//  MessageDataManager.swift
//  youMed
//
//  Created by thinhdang on 11/14/20.
//

import UIKit
import FirebaseDatabase

class MessageDataManager{
    
    static let databaseRef = Database.database().reference()
    
    static func setMessage(thread : String, messageData : MessageDataModel){
       let ref = databaseRef.child("Messages").child(thread).childByAutoId()
        ref.setValue(messageData.toDictionary())
    }
    
    
    static func getAllMessagesInConversation(thread:String, completion:@escaping([MessageDataModel])->Void){
        
        var allmessages = [MessageDataModel]()
        Database.database().reference(withPath: "Messages").child(thread).observe(.value) { (dataSnapShot) in
    
            if let snapShot = dataSnapShot.children.allObjects as? [DataSnapshot]{
                allmessages.removeAll()
                for snap in snapShot{
                    let snapdata = snap.value as! NSDictionary
                    let message = snapdata["message"] as? String
                    let recieverId = snapdata["recieverId"] as? String
                    let senderId = snapdata["senderId"] as? String
                    //print(message)
                    allmessages.append(MessageDataModel(
                        msg: message!,
                        rvrId: recieverId!,
                        sndrId: senderId!))
                }
                completion(allmessages)
            }
        }
    }
    
    static func getAllConversation(completion:@escaping([MessageDataModel])->Void){
        //let sendUserId = BaseClient.shared.userId
        var allConversation = [MessageDataModel]()
        databaseRef.child("Messages").observe(.value) { (dataSnapShot) in
            allConversation.removeAll()
            for snap in dataSnapShot.children{
                let userSnap = snap as! DataSnapshot
                let userDict = userSnap.value as! [String:String]
                let message = userDict["message"]
                let recieverId = userDict["recieverId"]
                let senderId = userDict["senderId"]
                
                
//                if sendUserId != userId{
                allConversation.append(MessageDataModel(msg: message!, rvrId: recieverId!, sndrId: senderId!))
//                }
            }
            completion(allConversation)
        }
    }
    
}
