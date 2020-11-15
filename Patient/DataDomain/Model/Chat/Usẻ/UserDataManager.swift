//
//  UserDataManager.swift
//  youMed
//
//  Created by thinhdang on 11/14/20.
//

import UIKit
import FirebaseDatabase

class UserDataManager{
    
    
    
    static let databaseRef = Database.database().reference()
    
    static func setUserData(userData : UserDataModel, userId : String){
        let ref = databaseRef.child("User").child(userId)
        ref.setValue(userData.toDictionary())
    }
    
    static func getUserData(userId : String, completion: @escaping(UserDataModel)->Void){
        databaseRef.child("User").child(userId).observe(.value) { (dataSnapShot) in
            if let snapShot = dataSnapShot.value as? NSDictionary{
                let name = snapShot["name"] as? String
                let avatar = snapShot["avatar"] as? String
                let email = snapShot["email"] as? String
                let userId = snapShot["userId"] as? String
                
                let userData = UserDataModel(Uname: name!, Uemail: email!, Uavatar: avatar!, UuserId: userId!)
                completion(userData)
            }
        }
    }
    
    static func getAllUsers(completion:@escaping([UserDataModel])->Void){
        let sendUserId = BaseClient.shared.userId
        var allUserData = [UserDataModel]()
        databaseRef.child("User").observe(.value) { (dataSnapShot) in
            allUserData.removeAll()
            for snap in dataSnapShot.children{
                let userSnap = snap as! DataSnapshot
                //let uid = userSnap.key
                let userDict = userSnap.value as! [String:String]
                let name = userDict["name"]
                let email = userDict["email"]
                let avatar = userDict["avatar"]
                let userId = userDict["userId"]
                
                if sendUserId != userId{
                    allUserData.append(UserDataModel(Uname: name!, Uemail: email!, Uavatar: avatar!, UuserId: userId!))
                }
            }
            completion(allUserData)
        }
        
    }
}
