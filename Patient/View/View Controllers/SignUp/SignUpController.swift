//
//  SignUpController.swift
//  youMed
//
//  Created by thinhdang on 11/7/20.
//


import UIKit
import iOSDropDown

class SignUpController: UIViewController {

    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfDateOfBirth: UITextField!
    @IBOutlet weak var usernameValidated: UILabel!
    @IBOutlet weak var firstnameValidated: UILabel!
    @IBOutlet weak var lastnameValidated: UILabel!
    @IBOutlet weak var passwordValidated: UILabel!
    @IBOutlet weak var confirmValidated: UILabel!
    @IBOutlet weak var emailvalidated: UILabel!
    @IBOutlet weak var phoneValidated: UILabel!
    
    let dateFormatter = DateFormatter()
    var option = Options()
    let datePicker = UIDatePicker()
    var isMale: Bool = true
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        messageValited()
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
        if tfPhoneNumber.isEditing || tfEmail.isEditing || tfConfirmPassword.isEditing{
            view.frame.origin.y = -300
        }else{
            view.frame.origin.y = 0
        }
    }
    
    private func configureTextFields(){
        tfEmail.delegate = self
        tfPassword.delegate = self
        tfUserName.delegate = self
        tfLastName.delegate = self
        tfFirstName.delegate = self
        tfConfirmPassword.delegate = self
        tfPhoneNumber.delegate = self
          
    }
    func messageValited(){
        usernameValidated.text = ""
        firstnameValidated.text = ""
        lastnameValidated.text = ""
        passwordValidated.text = ""
        confirmValidated.text = ""
        emailvalidated.text = ""
        phoneValidated.text = ""
    }

    @IBAction func username_act(_ sender: Any){
        let text = tfUserName.text ?? ""
        if text.isValidName {
            tfUserName.textColor = UIColor.link
            usernameValidated.text = ""
        } else {
            tfUserName.textColor = UIColor.red
            usernameValidated.text = "Your username should have at least 5 letter!"
        }
    }
    
    @IBAction func lastname_act(_ sender: Any){
        let text = tfLastName.text ?? ""
        if text.isValidName {
            tfUserName.textColor = UIColor.link
            lastnameValidated.text = ""
        } else {
            tfUserName.textColor = UIColor.red
            lastnameValidated.text = "Your last name should have at least 2 letter!"
        }
    }
    
    @IBAction func firstname_act(_ sender: Any){
        let text = tfFirstName.text ?? ""
        if text.isValidName {
            tfUserName.textColor = UIColor.link
            firstnameValidated.text = ""
        } else {
            tfUserName.textColor = UIColor.red
            firstnameValidated.text = "Your first name should have at least 2 letter!"
        }
    }
    
    @IBAction func password_act(_ sender: Any){
        let text = tfPassword.text ?? ""
        if text.isValidPassword{
            tfPassword.textColor = UIColor.link
            passwordValidated.text = ""
        } else {
            tfPassword.textColor = UIColor.red
            passwordValidated.text = "Your password should contain symbol, number and upper letter"
        }
    }
    
    @IBAction func confirm_act(_ sender: Any){
        let text = tfConfirmPassword.text ?? ""
        if(tfPassword.text! != tfConfirmPassword.text){
            tfPassword.textColor = UIColor.link
            confirmValidated.text = "Your confirm password is not match!"
        }
        if text.isValidPassword{
            tfConfirmPassword.textColor = UIColor.link
            confirmValidated.text = ""
        } else {
            tfConfirmPassword.textColor = UIColor.red
            confirmValidated.text = "Your password should contain symbol, number and upper letter"
        }
    }
    
    @IBAction func moveToSignIn(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignInControllerId) as! SignInController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signUp(_ sender: Any) {
        if(tfConfirmPassword.text! != tfPassword.text!){
            tfConfirmPassword.textColor = UIColor.red
            confirmValidated.text = "Your confirm password and password are not match!"
        }else{
            BaseConnection.request(BaseClient.Service.register(username: tfUserName.text!,
                                                               email: tfEmail.text!,
                                                               firstName: tfFirstName.text!,
                                                               lastName: tfLastName.text! ,
                                                               dateOfBirth: datePicker.date,
                                                               phoneNumber: tfPhoneNumber.text ?? "",
                                                               password: tfPassword.text!,
                                                               confirmPassword: tfConfirmPassword.text!),
                                                               RegisterResponse.self,
               completion: { (result,err) in
               guard err == nil else {
                    
                    print(self.tfDateOfBirth.text!)
                    print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                    
                    if err?.mErrorCode == 0 {
                        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignInControllerId) as! SignInController
                        self.navigationController?.pushViewController(controller, animated: true)
                       
                    }
                    else{
                        // create the alert
                        let alert = UIAlertController(title: "My Title", message: "Login Fail", preferredStyle: UIAlertController.Style.alert)

                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                    return
                    }
               })
        }
    
        if(tfUserName.text!.isEmpty || tfFirstName.text!.isEmpty || tfLastName.text!.isEmpty || tfPassword.text!.isEmpty || tfConfirmPassword.text!.isEmpty || tfEmail.text!.isEmpty){
            usernameValidated.text = "This field is required"
            firstnameValidated.text = "This field is required"
            lastnameValidated.text = "This field is required"
            passwordValidated.text = "This field is required"
            confirmValidated.text = "This field is required"
            emailvalidated.text = "This field is required"
        }
    }
    
    //MARK: -Birthday
    func showDatePicker(){
      //Formate Date
      datePicker.datePickerMode = .date

     //ToolBar
     let toolbar = UIToolbar();
     toolbar.sizeToFit()
     let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
      let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

   toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        tfDateOfBirth.inputAccessoryView = toolbar
        tfDateOfBirth.inputView = datePicker

   }

    @objc func donedatePicker(){

     let formatter = DateFormatter()
     formatter.dateFormat = "MM/dd/yyyy"
       tfDateOfBirth.text = formatter.string(from: datePicker.date)
     self.view.endEditing(true)
   }

   @objc func cancelDatePicker(){
      self.view.endEditing(true)
    }

}

extension SignUpController : UITextFieldDelegate{
    //Textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.hideKeyboardWhenTappedAround()
        switch textField{
            case tfUserName:
                tfFirstName.becomeFirstResponder()
            case tfFirstName:
                tfLastName.becomeFirstResponder()
            case tfLastName:
                tfPassword.becomeFirstResponder()
            case tfPassword:
                tfConfirmPassword.becomeFirstResponder()
            case tfConfirmPassword:
                tfEmail.becomeFirstResponder()
            case tfEmail:
                tfPhoneNumber.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
                view.frame.origin.y = 0
            }
        return true
    }
}
