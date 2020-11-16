//
//  CommonExtension.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/22/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func initController(id: String) -> UIViewController {
        return (storyboard?.instantiateViewController(withIdentifier: id))!
    }
    
    func resetRoot(id: String) {
        guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? UIViewController
        else {
            return
        }
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
        
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func navigationTitle(title: String) -> Void {
        self.navigationItem.title = title

          let navBar = self.navigationController?.navigationBar

            // change the bar tint color to change what the color of the bar itself looks like
            navBar?.barTintColor = UIColor.white

            // tint color changes the color of the nav item colors eg. the back button
            navBar?.tintColor = UIColor.white
        
            
            // the following attribute changes the title color
            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}





