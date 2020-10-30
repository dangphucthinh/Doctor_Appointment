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
    
    var data : Doctor?
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bioTextView.text = data?.bio
        nameTextField.text = data?.fullName
        emailTextField.text = data?.certification
        
        let ava: String? = data?.avatar!
        let url = URL.init(string:"\(ava ?? "No image found")")
        imgAva.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
    }
}
