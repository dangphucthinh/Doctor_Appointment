//
//  ViewController.swift
//  youMed
//
//  Created by thinhdang on 10/23/20.
//

import UIKit
import RealmSwift
import SDWebImage

class HomePageController: UIViewController {

    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnSearch: CustomButton!
        
    var listDoctor = List<Doctor>()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadDoctor()
        self.setNavigationBarLogo(title: "HOME", controlEvents: .touchUpInside,
        ForAction:{() -> Void in
            // Search action
            print("Search")
        })
        hideKeyboardWhenTappedAround()
        tfSearch.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")

  }
    
    
    @IBAction func search(_ sender: Any) {
        if(!tfSearch.text!.isEmpty) {
            let controller: DoctorViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorViewControllerId) as! DoctorViewController
            controller.searchPhrase = tfSearch.text!
            controller.searchDoctor = true
        
            self.navigationController?.pushViewController(controller, animated: true)
    }
        else {
            print("ccc")
        }
    }
        
    
}

extension HomePageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 1){
            return 1
        }
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if listDoctor.count >= 0{
           return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "specialistCell") as! SpecialistTableViewCell
            cell.loadInformation()
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailTableViewCell
            
            if indexPath.row < listDoctor.count {
               cell.data = listDoctor[indexPath.row]
            } else {
                // Handle non-existing object here
                print("hihi")
            }
            
            cell.delegate = self
         
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 0
        case 1:
            return 200
        default:
            return 219
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller: DoctorInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorInfoViewControllerId) as! DoctorInfoViewController
        
        controller.data = listDoctor[indexPath.row]
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as! HeaderView
            header.delegateDoctor = self
            header.delegateHospital = self
            return header
        }
        if section == 1{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))

            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width, height: headerView.frame.height-10)
            label.text = "SPECIALIST"
            //label.font = UIFont().futuraPTMediumFont(16) // my custom font
            label.textColor = .white // my custom colour
            label.backgroundColor = .link
            label.font = UIFont.boldSystemFont(ofSize: 16)
            headerView.addSubview(label)
            return headerView
        }
        if section == 2{
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))

            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width, height: headerView.frame.height-10)
            label.text = "DOCTOR"
            //label.font = UIFont().futuraPTMediumFont(16) // my custom font
            label.textColor = .white // my custom colour
            label.backgroundColor = .link
            label.font = UIFont.boldSystemFont(ofSize: 16)
            headerView.addSubview(label)

            return headerView
        }
        return UITableViewHeaderFooterView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 130
        }
        return 30
    }
    
    func loadDoctor(){
        BaseClient.shared.GetListDoctor(completion: { [self]
                                        (isSuccess: Bool?, error: NSError?, value: AnyObject?) in

                                        if(isSuccess!){
                                          let user = value as! ResponseDoctor

                                            let listTemp = user.data as List<Doctor>
                                            for item in listTemp{
                                                self.listDoctor.append(item)
                                            }
                                            self.tableView.reloadData()
                                        }

                                })
    }
    
}

extension HomePageController : DetailTableViewCellProtocol{
    func doctorPage(_ data: Doctor) {
        let controller: MakeAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MakeAppointmentViewControllerId) as! MakeAppointmentViewController

        controller.doctorId = data.id!
        controller.doctor = data
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension HomePageController : DoctorViewProtocol{
    func doctorPage() {
        let controller: DoctorViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorViewControllerId) as! DoctorViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension HomePageController : HospitalViewProtocol{
    func hospitalPage() {
        let controller: HospitalViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.HospitalViewControllerId) as! HospitalViewController

        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension HomePageController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        hideKeyboardWhenTappedAround()
        return true
    }
}

extension HomePageController : SpecialtyCellProtocol  {
    func specialtyPage() {
        let controller: HospitalSpecialtiesViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.HospitalSpecialtiesViewControllerId) as! HospitalSpecialtiesViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
//
//extension HomePageController : doctorViewProtocol  {
//    func doctorPage(specName: String) {
//        let controller: DoctorViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorViewControllerId) as! DoctorViewController
//        controller.specialHospital = specName
//        controller.isSpecial = true
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
//}
