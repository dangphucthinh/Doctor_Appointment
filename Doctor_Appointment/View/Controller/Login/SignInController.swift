//
//  SignInController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 9/10/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
class SignInController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
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
    
    
    @IBAction func Login(_ sender: Any) {
        BaseConnection.request(BaseClient.APIRouter.login(username: tfUsername.text!, password: tfPassword.text!, grant_type: "password"), LoginResponse.self, completion: {
            (result, err) in
            guard err != nil else {
                print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                // create the alert
                let alert = UIAlertController(title: "My Title", message: "Login Fail", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.HomePageControllerId) as! HomePageController
            
            self.navigationController?.pushViewController(controller, animated: true)
            
        })
    }
}
