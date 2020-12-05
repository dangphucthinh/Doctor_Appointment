//
//  DoctorInfoViewController.swift
//  youMed
//
//  Created by Oscar on 11/30/20.
//

import UIKit

class DoctorInfoViewController: UIViewController {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSpecialty: UILabel!
    @IBOutlet weak var lbHospital: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var ContentBioView: UIView!
    @IBOutlet weak var btnChat: UIButton!
    
    var data : Doctor?
    var dataUser: UserDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
        ContentView.roundedView(cornerRadius: 15, borderWidth: 1, borderCorlor: Color.borderColorBlue)
        ContentBioView.roundedView(cornerRadius: 15, borderWidth: 1, borderCorlor: Color.borderColorBlue)
        imgAvatar.roundedImageView()
    }
    
    private func loadData(){
        bioTextView.text = data?.bio
        lbName.text = data?.fullName?.uppercased()
        lbSpecialty.text = data?.specialtyName
        lbPhone.text = data?.phoneNumber
        lbHospital.text = data?.hospital_Name
        btnChat.setTitle("Chat with Dr. \(String((data?.fullName)!))", for: .normal)
        
        let ava: String? = data?.avatar
        let url = URL.init(string:"\(ava ?? "No image found")")
        imgAvatar.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      //  loadData()
        bioTextView.isEditable = false
     
        self.showNavigationBar(animated: animated)
        self.navigationTitle(title: "DOCTOR")
    }
    @IBAction func chatWithUs(_ sender: Any) {
        // create the alert
        let controller: MessengerViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MessengerViewControllerId) as! MessengerViewController
        dataUser = UserDataModel(Uname: (data?.fullName)!, Uemail: (data?.email)!, Uavatar: (data?.avatar)!, UuserId: (data?.id)! )
        UserDataManager.setUserData(userData: dataUser!, userId: data?.id ?? "Not found ID")
        controller.recieverUser = dataUser!
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func bookingNow(_ sender: Any) {
        let controller: MakeAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MakeAppointmentViewControllerId) as! MakeAppointmentViewController
        
        controller.doctorId = (data?.id)!
        controller.doctor = data
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
