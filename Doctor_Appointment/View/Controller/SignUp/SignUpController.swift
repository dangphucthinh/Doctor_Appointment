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
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        //showDatePicker()
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        BaseConnection.request(BaseClient.Service.register(username: "thinh357445",
                                                           email: "thinh123@enclave.com",
                                                           firstName: "thinh",
                                                           lastName: "dang",
                                                           dateOfBirth: "10/10/2020",
                                                           phoneNumber: "0123456789",
                                                           password: "Admin@123",
                                                           confirmPassword: "Admin@123"),
                                                           LoginResponse.self,
           completion: { (result,err) in
            guard err == nil else {
                print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                
                print(result)
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
//    func showDatePicker(){
//      //Formate Date
//      datePicker.datePickerMode = .date
//
//     //ToolBar
//     let toolbar = UIToolbar();
//     toolbar.sizeToFit()
//     let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
//      let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
//
//   toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
//
//        tfDateOfBirth.inputAccessoryView = toolbar
//        tfDateOfBirth.inputView = datePicker
//
//   }
//
//    @objc func donedatePicker(){
//
//     let formatter = DateFormatter()
//     formatter.dateFormat = "MM/dd/yyyy"
//        tfDateOfBirth.text = formatter.string(from: datePicker.date)
//     self.view.endEditing(true)
//   }
//
//   @objc func cancelDatePicker(){
//      self.view.endEditing(true)
//    }
    
    //MARK: -Gender
    
}
