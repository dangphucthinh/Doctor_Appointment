//
//  Loading.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/16/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import JGProgressHUD

class Loading: NSObject {

    static let activity = JGProgressHUD(style: .extraLight)
    
    static func showLoading(message: String, view: UIView) {
        activity.textLabel.text = message
        activity.show(in: view)
    }
     
    static func dismissLoading() {
        activity.dismiss(afterDelay: 1.0)
    }
    
    static func showMessage(message: String) {
        
    }
}
