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
