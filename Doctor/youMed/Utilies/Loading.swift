//
//  Loading.swift
//  youMed
//
//  Created by thinhdang on 11/15/20.
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
