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
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailIconImage: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordIconImage: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        self.navigationController?.isNavigationBarHidden = true
        customView()
    }
    
    private func customView(){
        emailView.layer.cornerRadius = 35
        emailView.layer.masksToBounds = true
        passwordView.layer.cornerRadius = 35
        passwordView.layer.masksToBounds = true
        logInButton.layer.cornerRadius = 25
        logInButton.layer.masksToBounds = true
            
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignUpControllerId) as! SignUpController
        
        self.present(controller,animated: true)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.ForgotPasswordControllerId) as! ForgotPasswordController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
   
    @IBAction func signIn(_ sender: Any) {
        
        if(!usernameTextField.text!.isEmpty && !passwordTextField.text!.isEmpty) {
            Loading.showLoading(message: Message.LoadingMessage, view: self.view)
            BaseClient.shared.loginWithUrl(username: usernameTextField.text!,
                                           password: passwordTextField.text!)
            { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                Loading.dismissLoading()

                if(isSuccess!) {

                    self.resetRoot(id: StoryboardID.ParentViewControllerId)
                    
                } else {
                    // Show message login fail
                    // create the alert
                let alert = UIAlertController(title: "My Title", message: "Login Fail", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
                }
            }
        }
    
    }
}

