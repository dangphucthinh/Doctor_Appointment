//
//  EditProfileViewController.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/30/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import SDWebImage

class EditProfileViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var imgAva: UIImageView!

    @IBOutlet weak var bookingAppoinment: UIButton!
    
    var data : Doctor?
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
        bioTextView.isEditable = false
        
    }
    
    private func loadData(){
        bioTextView.text = data?.bio
        nameTextField.text = data?.fullName
        emailTextField.text = data?.specialtyName
        
        let ava: String? = data?.avatar!
        let url = URL.init(string:"\(ava ?? "No image found")")
        imgAva.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
    }
    
    @IBAction func showAlert(_ sender: UIButton){
        // create the alert
                let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
    }
}
