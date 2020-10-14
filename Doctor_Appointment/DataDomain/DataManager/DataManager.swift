//
//  DataManager.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
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
