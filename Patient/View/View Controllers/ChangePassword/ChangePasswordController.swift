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
    @IBOutlet weak var lbOldPass: UILabel!
    @IBOutlet weak var lbNewPass: UILabel!
    @IBOutlet weak var lbConfirmPass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        hideKeyboardWhenTappedAround()
        hideValidate()
        
        //listen for keyboard events
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }


    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification:NSNotification) {
        if tfConfirmPassword.isEditing {
            view.frame.origin.y = -300
        }else{
            view.frame.origin.y = 0
        }
    }
    
    func hideValidate(){
        lbOldPass.text = ""
        lbNewPass.text = ""
        lbConfirmPass.text = ""
    }
    
    
    @IBAction func password_validated(_ sender: Any) {
        let text = tfOldPassword.text ?? ""
        if text.isValidPassword{
            tfOldPassword.textColor = UIColor.black
            lbOldPass.text = ""
        } else {
            tfOldPassword.textColor = UIColor.red
            lbOldPass.text = "Your password should contain symbol, number and upper character"
        }
    }
    
    @IBAction func newPass_validated(_ sender: Any){
        let newPassText = tfNewPassword.text ?? ""
        if newPassText.isValidPassword{
            tfNewPassword.textColor = UIColor.black
            lbNewPass.text = ""
        } else {
            tfNewPassword.textColor = UIColor.red
            lbNewPass.text = "Your password should contain symbol, number and upper character"
        }
    }
    
    @IBAction func confirmPass_validated(_ sender: Any){
        let confirmPassText = tfConfirmPassword.text ?? ""
        if confirmPassText.isValidPassword{
            tfConfirmPassword.textColor = UIColor.black
            lbConfirmPass.text = ""
        } else {
            tfConfirmPassword.textColor = UIColor.red
            lbConfirmPass.text = "Your password should contain symbol, number and upper character"
        }
    }

    @IBAction func check(_ sender : Any){
        if(tfNewPassword.text! != tfConfirmPassword.text!){
            tfNewPassword.textColor = UIColor.red
            tfConfirmPassword.textColor = UIColor.red
            lbNewPass.text = "Your new password and confirm password should me match!"
            lbConfirmPass.text = "Your new password and confirm password should me match!"
        }
    }
    
    
    @IBAction func btnResetPass(_ sender: Any) {
        if(!tfOldPassword.text!.isEmpty && !tfNewPassword.text!.isEmpty && !tfConfirmPassword.text!.isEmpty){
            Loading.showLoading(message: Message.LoadingMessage, view: self.view)
            
            BaseClient.shared.changePassword(oldPassword: tfOldPassword.text!,
                                             newPassword: tfNewPassword.text!,
                                             confirmPassword: tfConfirmPassword.text!,
                                             completion: { [self]
                                                (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                Loading.dismissLoading()
                                                let rs = value as! ResponseUser
                                                if rs.status == 1{
                                                    // create the alert
                                                    let alert = UIAlertController(title: "Something wrong!", message: "Check check your password again.", preferredStyle: UIAlertController.Style.alert)
                                                    
                                                    // add an action (button)
                                                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                                                    
                                                    // show the alert
                                                    self.present(alert, animated: true, completion: nil)
                                                }
                                                if rs.status == 0{
                                                    let alert = UIAlertController(title: "Change password success!", message: "", preferredStyle: UIAlertController.Style.alert)
                                                    
                                                    // add an action (button)
                                                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                                                        
                                                        self.navigationController?.popViewController(animated: true)
                                                    }))
                                                    
                                                    // show the alert
                                                    self.present(alert, animated: true, completion: nil)
                                                }
                                                
                                             })
        }
        else {
            lbOldPass.text = "This field is required"
            lbNewPass.text = "This filed is required"
            lbNewPass.text = "This field is required"
        }
    }
}

extension ChangePasswordController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        switch textField {
        case tfOldPassword:
            tfNewPassword.becomeFirstResponder()
        case tfNewPassword:
            tfConfirmPassword.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
            view.frame.origin.y = 0
        }
    return true
    }
}
