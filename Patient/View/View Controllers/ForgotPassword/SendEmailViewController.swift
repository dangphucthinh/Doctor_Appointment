//
//  SendEmailViewController.swift
//  youMed
//
//  Created by Oscar on 11/22/20.
//

import UIKit
import SafariServices

class SendEmailViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbEmailvalidate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
        lbEmailvalidate.text = ""
    }
    
    private func configureDelegate(){
        tfEmail.delegate = self
    }
    
    @IBAction func email_act(_ sender: Any){
        
        let text = tfEmail.text ?? ""
        if text.isValidEmail{
            tfEmail.textColor = UIColor.blue
            lbEmailvalidate.text = ""
        } else {
            tfEmail.textColor = UIColor.red
            lbEmailvalidate.text = "Your email should be xyz@gmail.com"
        }
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        let text = tfEmail.text ?? ""
        if text.isValidEmail{
            tfEmail.textColor = UIColor.blue
            lbEmailvalidate.text = ""
            
            BaseClient.shared.resetPassword(email: tfEmail.text!,
                                            completion:{ [self]
                                                (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                                                Loading.dismissLoading()
                                                
                                                if(isSuccess!) {
                                                    let rs = value as! ResponseUser
                                                    if rs.status == 1{
                                                        let alert = UIAlertController(title: "My Warning", message: "Your email is not activated", preferredStyle: UIAlertController.Style.alert)
                                                        
                                                        // add an action (button)
                                                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                                        
                                                        // show the alert
                                                        self.present(alert, animated: true, completion: nil)
                                                    }
                                                    if rs.status == 0 {
                                                        // Show message login fail
                                                        // create the alert
                                                        let controller = SFSafariViewController(url: URL(string: "https://gmail.com")!)
                                                        present(controller, animated: true)
                                                       
                                                    }
                                                }
                                            })
            
        } else {
            tfEmail.textColor = UIColor.red
            lbEmailvalidate.text = "Your email should be xyz@gmail.com"
        }
    }
}

extension SendEmailViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

