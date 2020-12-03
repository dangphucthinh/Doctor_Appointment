//
//  ListAppointmentViewController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 11/5/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift

class ListAppointmentViewController: UITableViewController {
    
    var listAppointment = List<Appointment>()

    
    var UserId = BaseClient.shared.userId

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        listAppointment = List<Appointment>()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.isNavigationBarHidden = true

        
        let nib = UINib.init(nibName: StoryboardID.AppointmentTableCellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StoryboardID.AppointmentTableCellId)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listAppointment.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
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


