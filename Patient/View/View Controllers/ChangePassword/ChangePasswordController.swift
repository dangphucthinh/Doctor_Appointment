//
//  ForgotPasswordController.swift
//  youMed
//
//  Created by thinhdang on 11/7/20.
//

import UIKit

class ChangePasswordController: UIViewController {

    @IBOutlet weak var tfOldPassword: UITextField!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnResetPass(_ sender: Any) {
        BaseClient.shared.changePassword(oldPassword: tfOldPassword.text!,
                                         newPassword: tfNewPassword.text!,
                                         confirmPassword: tfConfirmPassword.text!,
                                         completion: { [self]
                                                 (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                                          
                                                 if(isSuccess!){
                                                  
                                                        
                                    // create the alert
                                            let alert = UIAlertController(title: "Something wrong!", message: "Check check your password again.", preferredStyle: UIAlertController.Style.alert)

                                            // add an action (button)
                                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                                            // show the alert
                                            self.present(alert, animated: true, completion: nil)
                                        
                                                 }
                             })

        
        }
    }

