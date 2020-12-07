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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listAppointment = List<Appointment>()
        self.setNavigationBarLogo(title: "HOME", controlEvents: .touchUpInside,
        ForAction:{() -> Void in
            // Search action
            print("Search")
        })
        loadData(statusId: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listAppointment = List<Appointment>()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "headerView")
        
        let nib2 = UINib(nibName: StoryboardID.AppointmentTableCellId, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: StoryboardID.AppointmentTableCellId)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAppointment.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardID.AppointmentTableCellId, for: indexPath) as! AppointmentTableCell

        // Configure the cell...
       
        if indexPath.row < listAppointment.count {
           // name = "\(listAppointment[indexPath.row].doctorName ?? "Not name")"
            cell.commonInit("\(listAppointment[indexPath.row].patientName ?? "Not name")",
                            "\(listAppointment[indexPath.row].issue ?? "Not name")",
                            "\(listAppointment[indexPath.row].meetingTime ?? "Not name")")
          
        } else {
            // Handle non-existing object here
            print("hihi")

        }
        return cell
            
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      //  let controller: PatientProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.PatientProfileViewControllerId) as! PatientProfileViewController
        
     //   controller.data = listAppointment[indexPath.row]
        
     //   self.navigationController?.pushViewController(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardID.AppointmentTableCellId)
        return (cell?.frame.height)!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? HeaderView
            //let appointmentCount = listAppointment.count
            //header?.btnCount.setTitle("\(appointmentCount)", for: .normal)
        header?.loadRequestAppointment()
            return header

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as? HeaderView
        return (header?.frame.height)!
    }
    
    private func loadData(statusId: Int){
        BaseClient.shared.GetListAppointment(userId: UserId!,
                                             statusId: statusId,
                                             completion: { [self]
                     (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                            let rs = value as! ResponseListAppointment

                              let listTemp = rs.data as List<Appointment>

                                for item in listTemp{
                                    self.listAppointment.append(item)
                                }
                            tableView.reloadData()
                     })
        
             
        
    }

}
