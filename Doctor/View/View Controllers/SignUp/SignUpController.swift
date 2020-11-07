//
//  SignUpController.swift
//  youMed
//
//  Created by thinhdang on 11/7/20.
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
    

    let dateFormatter = DateFormatter()

    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        self.hideKeyboardWhenTappedAround()
    }
    


    @IBAction func signUp(_ sender: Any) {
       
    //print(datePicker.date)
//        BaseConnection.request(BaseClient.Service.register(username: tfUserName.text!,
//                                                           email: tfEmail.text!,
//                                                           firstName: tfFirstName.text!,
//                                                           lastName: tfLastName.text!,
//                                                           dateOfBirth: datePicker.date,
//                                                           phoneNumber: tfPhoneNumber.text!,
//                                                           password: tfPassword.text!,
//                                                           confirmPassword: tfConfirmPassword.text!),
//                                                           RegisterResponse.self,
//           completion: { (result,err) in
//           guard err == nil else {
//                
//                print(self.tfDateOfBirth.text!)
//                print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
//                
//                if err?.mErrorCode == 0 {
//                    let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.MainViewControllerId) as! MainViewController
//                    self.navigationController?.present(controller, animated: true)
//                   
//                }
//                else{
//                    // create the alert
//                    let alert = UIAlertController(title: "My Title", message: "Login Fail", preferredStyle: UIAlertController.Style.alert)
//
//                    // add an action (button)
//                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//                    // show the alert
//                    self.present(alert, animated: true, completion: nil)
//                }
//                return
//                }
//           })
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
