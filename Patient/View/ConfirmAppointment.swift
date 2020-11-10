//
//  ConfirmAppointmnet.swift
//  youMed
//
//  Created by Oscar on 11/10/20.
//

import UIKit

class ConfirmAppointment: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib.init(nibName: StoryboardID.ConfirmPatientTableViewCellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StoryboardID.ConfirmPatientTableViewCellId)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return listAppointment.count
        1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardID.ConfirmPatientTableViewCellId, for: indexPath) as! ConfirmPatientTableViewCell

        // Configure the cell...
       
//        if indexPath.row < listAppointment.count {
//           // name = "\(listAppointment[indexPath.row].doctorName ?? "Not name")"
//            cell.commonInit("\(listAppointment[indexPath.row].doctorName ?? "Not name")",
//                            "\(listAppointment[indexPath.row].doctorPhone ?? "Not name")",
//                            "\(listAppointment[indexPath.row].meetingTime ?? "Not name")")
//
//        } else {
//            // Handle non-existing object here
//            print("hihi")
//
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //let vc = ChatViewController()
      
    }
    
}
