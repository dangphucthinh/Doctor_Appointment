//
//  InfomationViewController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 10/21/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift

class InfomationViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var allergyTextField: UITextField!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var avaPicker: UIView!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var symptonTextField: UITextField!
    @IBOutlet weak var historyTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    @IBOutlet weak var button: UIView!
    
    var UserId = BaseClient.shared.userId
    
    //var current:Contacts!
    override func viewDidLoad() {
        super.viewDidLoad()
        //LoadInform(UserId: UserId!)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleSave))
        self.hideKeyboardWhenTappedAround()
        self.dateOfBirthTextField.setInputViewDatePicker(target: self, selector: #selector(tapDone))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleSave))
        
        
            
    }
    
    @objc func handleSave(_ sender: UIBarButtonItem){

    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //showInfor()
       // self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(handleTap)) //declear tap view
        avaPicker.addGestureRecognizer(tapGuesture)
        
        let tapGuesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1)) //declear tap view
                button.addGestureRecognizer(tapGuesture1)
    }
    
    @objc func handleTap1(_ sender: AnyObject){
//            let alert = UIAlertController(title: "Call", message: "concac", preferredStyle: UIAlertController.Style.alert)
//            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: {action in
//                let number:NSURL = URL(string: "tel://" + "0935336719")! as NSURL
//                UIApplication.shared.open(number as URL, options: [:], completionHandler: nil)
//            }))
//            present(alert,animated: true,completion: nil)
        
        BaseConnection.request(BaseClient.Service.UpdateUser(userId: "43f90a99-61e8-44bd-9c1e-cc963303d465",
                                                             firstName: "Thinh",
                                                             lastName: "Dang",
                                                             gender: false,
                                                             //avatar: UIImage(imageLiteralResourceName: "facebook"),
                                                             allergy: "nothing",
                                                             medicalHistory: "HIV/AIDS",
                                                             symptom: "nothing"),
                                                           RegisterResponse.self,
           completion: { (result,err) in
           guard err == nil else {
                
           
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
    
    
    @objc func tapDone() {
           if let datePicker = self.dateOfBirthTextField.inputView as? UIDatePicker { // 2-1
               let dateformatter = DateFormatter() // 2-2
               dateformatter.dateStyle = .medium // 2-3
               self.dateOfBirthTextField.text = dateformatter.string(from: datePicker.date) //2-4
           }
           self.dateOfBirthTextField.resignFirstResponder() // 2-5
       }
    
    @objc func handleTap(_ sender: AnyObject){
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "", message: "Choose an option", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePickerController.sourceType = .camera
                imagePickerController.allowsEditing = true
                self.present(imagePickerController, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Camera is not available", message: "Please select another option", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        present(imagePickerController, animated: true)
    }
    
    func LoadInform(UserId :String){
            BaseClient.shared.GetUserInfo(UserId: UserId,
                                          completion: {
                  (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                            let rs = value as! ResponseUser
                                            print(rs as Any)
                  if(isSuccess!){
                    let user = value as! ResponseUser

                 
                    self.nameTextField.text = user.data?.fullName
                    self.emailTextField.text = user.data?.email
                    self.phoneTextField.text = user.data?.phoneNumber
                    self.historyTextField.text = user.data?.medicalHistory
                    self.allergyTextField.text = user.data?.allergy
                    self.symptonTextField.text = user.data?.symptom
                                       
                  }
                
          })
        }
}

extension InfomationViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImageFromPicker : UIImage?
        if let edit = info[.editedImage] as? UIImage {
            selectedImageFromPicker = edit
        } else if let original = info[.originalImage] as? UIImage {
            selectedImageFromPicker = original
        }
        
        if let selectedImage = selectedImageFromPicker {
            imgAvatar.image = selectedImage
            imgAvatar.contentMode = .scaleAspectFit
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}


