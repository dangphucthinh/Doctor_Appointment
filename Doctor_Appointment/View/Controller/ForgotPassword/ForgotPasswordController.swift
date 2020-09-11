//
//  ForgotPasswordController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 9/10/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnResetPass(_ sender: Any) { 
            self.navigationController?.popViewController(animated: true)
    }
}
