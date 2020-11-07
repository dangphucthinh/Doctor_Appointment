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

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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
            cell.commonInit("\(listAppointment[indexPath.row].doctorName ?? "Not name")",
                            "\(listAppointment[indexPath.row].doctorPhone ?? "Not name")",
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
//
//
//                       let ava: String? = user.data?.avatar!
//                       let url = URL.init(string:"\(ava ?? "No image found")")
//                       self.nameTextField.text = user.data?.fullName
//                       self.emailTextField.text = user.data?.email
//                       self.phoneTextField.text = user.data?.phoneNumber
//                       self.historyTextField.text = user.data?.medicalHistory
//                       self.allergyTextField.text = user.data?.allergy
//                       self.symptonTextField.text = user.data?.symptom
//
//
//                       let dateString = user.data?.dateOfBirth
//                       let dateFormatter = DateFormatter()
//                       dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//                       let dateFromString = dateFormatter.date(from: dateString!)
//                       dateFormatter.dateFormat = "MM/dd/yyyy"
//                       let stringFromDate = dateFormatter.string(from: dateFromString!)
//                       self.dateOfBirthTextField.text = stringFromDate
//
//                       self.imgAvatar.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
//                 }
               
//         })



