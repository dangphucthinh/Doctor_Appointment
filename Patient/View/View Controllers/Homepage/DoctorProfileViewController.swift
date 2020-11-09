//
//  DoctorProfileViewController.swift
//  youMed
//
//  Created by thinhdang on 11/8/20.
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
        let controller: MakeAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MakeAppointmentViewControllerId) as! MakeAppointmentViewController
        
        controller.doctorId = (data?.id)!
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
