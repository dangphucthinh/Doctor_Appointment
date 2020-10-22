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
    var UserId = BaseClient.shared.userId
    
    //var current:Contacts!
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadInform(UserId: UserId!)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleSave))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //showInfor()
       // self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(handleTap)) //declear tap view
        avaPicker.addGestureRecognizer(tapGuesture)
    }
    
    @objc func handleTap(_ sender: AnyObject){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func handleSave(_ sender: UIBarButtonItem){

      
        self.navigationController?.popViewController(animated: true)
    }
    
    func LoadInform(UserId :String){
            BaseClient.shared.GetUserInfo(UserId: UserId,
                                          completion: {
                  (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                            let rs = value as! ResponseUser
                                            print(rs as Any)
                  if(isSuccess!){
                      let rsMovie = value as! ResponseUser

                 
                    self.nameTextField.text = rsMovie.data?.fullName
                    self.emailTextField.text = rsMovie.data?.email
                    self.phoneTextField.text = rsMovie.data?.phoneNumber
                    self.historyTextField.text = rsMovie.data?.medicalHistory
                    self.allergyTextField.text = rs.data?.allergy
                    self.symptonTextField.text = rs.data?.symptom
                                       
                  }
                
          })
        }
}

extension InfomationViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image =  info[UIImagePickerController.InfoKey(rawValue:"UIImagePickerControllerEditedImage")] as? UIImage{
            imgAvatar.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
