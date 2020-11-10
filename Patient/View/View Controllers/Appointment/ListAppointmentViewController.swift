//
//  ListAppointmentViewController.swift
//  youMed
//
//  Created by thinhdang on 11/8/20.
//

import UIKit
import RealmSwift

class ListAppointmentViewController: UITableViewController {
    
    var listAppointment = List<Appointment>()
   
    
    var UserId = BaseClient.shared.userId
    var statusId : Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        //self.navigationController?.isNavigationBarHidden = true

        
        let nib = UINib.init(nibName: StoryboardID.AppointmentTableCellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StoryboardID.AppointmentTableCellId)
    }
    @IBAction func refreshData(_ sender: UIRefreshControl) {

        sender.endRefreshing()
        tableView.reloadData()
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
        //let vc = ChatViewController()
      
    }
    
    private func loadData(){
        BaseClient.shared.GetListAppointment(userId: UserId!,
                                             statusId: statusId!,
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
