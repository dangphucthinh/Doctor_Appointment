//
//  EditProfileViewController.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/30/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import SDWebImage

class DoctorProfileViewController: UITableViewController {
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
        //self.navigationTitle(title: "\(data?.fullName ?? "Information")")
        self.navigationController?.isNavigationBarHidden = true
  
          
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
        let controller: TestViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.TestViewControllerId) as! TestViewController
        
        controller.doctorId = (data?.id)!
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
