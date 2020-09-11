//
//  SignInController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 9/10/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class SignInController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignUpControllerId) as! SignUpController
        
        self.present(controller,animated: true)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.ForgotPasswordControllerId) as! ForgotPasswordController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
