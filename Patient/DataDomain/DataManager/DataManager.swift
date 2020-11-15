//
//  DataManager.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
//

import Foundation
class DataManager: NSObject{
    static let shared = DataManager()
    func AddValue(key: String, value: String) -> Void {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    func GetValue(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
}
//
//class UserDefaultManager{
//    
//    static let userDefault = UserDefaults.standard
//    
//    //UserId (Firebase User Uid)
//    static var userId : String{
//        get{
//            return userDefault.string(forKey: "uid")!
//        }
//        set{
//            userDefault.set(newValue, forKey: "uid")
//        }
//    }
//}
