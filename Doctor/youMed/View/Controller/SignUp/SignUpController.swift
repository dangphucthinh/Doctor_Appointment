//
//  SignUpController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 9/7/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfDateOfBirth: UITextField!

    

    let dateFormatter = DateFormatter()

    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        setDelegate()
        self.hideKeyboardWhenTappedAround()
        
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
    private func setDelegate(){
        tfUserName.delegate = self
        tfFirstName.delegate = self
        tfLastName.delegate = self
        tfPassword.delegate = self
        tfConfirmPassword.delegate = self
        tfEmail.delegate = self
        tfPhoneNumber.delegate = self
        tfDateOfBirth.delegate = self
    }


    @IBAction func signUp(_ sender: Any) {
    
        BaseConnection.request(BaseClient.Service.register(username: tfUserName.text!,
                                                           email: tfEmail.text!,
                                                           firstName: tfFirstName.text!,
                                                           lastName: tfLastName.text!,
                                                           dateOfBirth: datePicker.date,
                                                           phoneNumber: tfPhoneNumber.text!,
                                                           password: tfPassword.text!,
                                                           confirmPassword: tfConfirmPassword.text!),
                                                           RegisterResponse.self,
           completion: { (result,err) in
           guard err == nil else {
                
                print(self.tfDateOfBirth.text!)
                print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                
                if err?.mErrorCode == 0 {
                    let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.MainViewControllerId) as! MainViewController
                    self.navigationController?.present(controller, animated: true)
                   
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
       tfDateOfBirth.text = formatter.string(from: datePicker.date)//(from: datePicker.date)
     self.view.endEditing(true)
   }

   @objc func cancelDatePicker(){
      self.view.endEditing(true)
    }
}

extension SignUpController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
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
        }
        return true
    }
}
