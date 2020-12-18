//
//  InfomationViewController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 10/21/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class InfomationViewController: UITableViewController {

   
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var avaPicker: UIView!
    @IBOutlet weak var addressTextField: UITextField!

    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var button: UIView!
    
    var UserId = BaseClient.shared.userId
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgAvatar.roundedImageView()
        self.hideKeyboardWhenTappedAround()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LoadInform(UserId: UserId!)
      
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(handleTap)) //declear tap view
        avaPicker.addGestureRecognizer(tapGuesture)
        
        let tapGuesture1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1)) //declear tap view
                button.addGestureRecognizer(tapGuesture1)
        
    }
    
    
    
    @objc func handleTap1(_ sender: AnyObject){
        var imageData : Data? = nil
        imageData = UIImage.pngData(imgAvatar.image!)()
        
        Loading.showLoading(message: "Loading", view: self.view)
        BaseClient.shared.updateProfile(userId: UserId!,
                                        firstName: nameTextField.text ?? "",
                                        lastName: lastNameTextField.text ?? "",
                                        imageData: imageData,
                                        phoneNumber: phoneTextField.text ?? "",
                                        completion: {
                (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                    Loading.dismissLoading()
                        let rs = value as! ResponseUser
                                            print(rs)
                                if isSuccess! {
                                    let alert = UIAlertController(title: "My Title", message: "Update Success", preferredStyle: UIAlertController.Style.alert)
            
                                // add an action (button)
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { [self]
                                    action in
                                    self.LoadInform(UserId: self.UserId!)
                                }))
            
                                // show the alert
                                self.present(alert, animated: true, completion: nil)
                                }
                                else {
                                                //create the alert
                                                let alert = UIAlertController(title: "My Title", message: "Update Fail", preferredStyle: UIAlertController.Style.alert)
                            
                                                // add an action (button)
                                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            
                                                // show the alert
                                                self.present(alert, animated: true, completion: nil)
                                }
                })
       
        LoadInform(UserId: UserId!)
        }
    
    

    //MARK: -Image picker
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
    
    
    //MARK: -Load info
    func LoadInform(UserId :String){
        Loading.showLoading(message: Message.LoadingMessage, view: self.view)
            BaseClient.shared.GetDoctorInfo(userId: UserId,
                                          completion: { [self]
                  (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                        Loading.dismissLoading()
                  if(isSuccess!){
                    let user = value as! ResponseDoctor
                    
                    let ava: String? = user.data?.avatar
                    let url = URL.init(string:"\(ava ?? "No image found")")
                    self.nameTextField.text = user.data?.firstName
                    self.lastNameTextField.text = user.data?.lastName
                    self.emailTextField.text = user.data?.email
                    self.phoneTextField.text = user.data?.phoneNumber
                    self.dateOfBirthTextField.text = dateToSQLDate(user.data?.dateOfBirth ?? "")
                    
                    self.imgAvatar.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
                  }
                
          })
        }
}

    //MARK: -Extension
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
            imgAvatar.layer.cornerRadius = imgAvatar.frame.height / 2
            //imgAvatar.layer.masksToBounds = true
            imgAvatar.layer.shouldRasterize = true
            imgAvatar.clipsToBounds = true
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
