//
//  ForgotPasswordController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 9/10/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController {

    @IBOutlet weak var tfOldPassword: UITextField!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnResetPass(_ sender: Any) {
//        BaseConnection.request(BaseClient.Service.changePassword(oldPassword: tfOldPassword.text!,
//                                                                 newPassword: tfNewPassword.text!,
//                                                                 confirmPassword: tfConfirmPassword.text!,
//                                                                 token: ),
//                               LoginResponse.self,
//                               completion: {
//                                (result, err) in
//                                guard err == nil else{
//                                    return
//                                }
//                               })
           // self.navigationController?.popViewController(animated: true)
    }
}
