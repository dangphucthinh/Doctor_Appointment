//
//  UserDataModel.swift
//  youMed
//
//  Created by thinhdang on 11/15/20.
//

import UIKit

class UserDataModel{
    let name : String
    let email : String
    let avatar : String
    let userId : String
    
    init(Uname : String, Uemail : String, Uavatar : String, UuserId : String) {
        
        self.name = Uname
        self.email = Uemail
        self.avatar = Uavatar
        self.userId = UuserId
    }
    
    func toDictionary()-> Any{
        return ["name":name, "email":email, "avatar":avatar, "userId":userId] as Any
    }
}
