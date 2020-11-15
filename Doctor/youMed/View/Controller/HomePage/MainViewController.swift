//
//  MainViewController.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var listAppointment = List<Appointment>()
    var UserId = BaseClient.shared.userId
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationTitle(title: "Home")
        self.navigationController?.isNavigationBarHidden = true
        loadData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "headerView")
        
        
        let nib2 = UINib(nibName: "CustomView", bundle: nil)
        tableView.register(nib2, forHeaderFooterViewReuseIdentifier: "customView")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAppointment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell =  tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath)
            let a = listAppointment[indexPath.row]
        
        
        
            let ava: String? = a.patientAvatar
            let url = URL.init(string:"\(ava ?? "Not Found")")
        
            cell.textLabel?.text = a.patientName
            cell.detailTextLabel?.text = a.issue
        
   
            cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
        
            cell.imageView?.backgroundColor = .systemBlue
            return cell
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let controller: DoctorProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorProfileViewControllerId) as! DoctorProfileViewController
        
        

        self.navigationController?.pushViewController(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell")
        return (cell?.frame.height)!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? HeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? HeaderView
        return (header?.frame.height)!
    }
    
    private func loadData(){
        BaseClient.shared.GetListAppointment(userId: UserId!,
                                             statusId: 2,
                                             completion: { [self]
                     (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                            let rs = value as! ResponseListAppointment

                              let listTemp = rs.data as List<Appointment>

                     

                                for item in listTemp{
                                    self.listAppointment.append(item)
                                }
                                self.tableView.reloadData()
                            
                                                
                     })
        
    }

}
