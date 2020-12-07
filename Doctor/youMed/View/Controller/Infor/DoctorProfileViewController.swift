//
//  DoctorProfileTableViewController.swift
//  youMed
//
//  Created by Oscar on 12/7/20.
//

import UIKit

class DoctorProfileViewController: UITableViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imgAva: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var lbSpecialties: UILabel!
    @IBOutlet weak var lbHospital: UILabel!
    @IBOutlet weak var bioView: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bioView.isEditable = false
        self.navigationTitle(title: "Profile")
        imgAva.roundedImageView()
        loadData(userID: BaseClient.shared.userId!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editButton))
        contentView.roundedView(cornerRadius: 15, borderWidth: 2, borderCorlor: Color.borderColor)
        bioView.roundedView(cornerRadius: 15, borderWidth: 2, borderCorlor: Color.borderColor)
    }

    @objc func editButton(_ sender: AnyObject){
        let controller: InfomationViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.InfomationViewControllerId) as! InfomationViewController
        

        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func loadData(userID : String){
            Loading.showLoading(message: Message.LoadingMessage, view: self.view)
                BaseClient.shared.GetDoctorInfo(userId: userID,
                                              completion: { [self]
                      (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
            Loading.dismissLoading()
                      if(isSuccess!){
                        let user = value as! ResponseDoctor
                        
                        let ava: String? = user.data?.avatar
                        let url = URL.init(string:"\(ava ?? "No image found")")
                        self.lbName.text = user.data?.fullName
                        self.lbPhone.text = user.data?.phoneNumber
                        self.lbSpecialties.text = user.data?.specialtyName
                        self.lbHospital.text = user.data?.hospitalName
                        self.bioView.text = user.data?.bio
                        
                        self.imgAva.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
                      }
                    
              })

    }

}
