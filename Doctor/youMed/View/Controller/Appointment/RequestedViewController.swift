//
//  RequestedViewController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 11/8/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import RealmSwift

class RequestedViewController: UITableViewController {
    
    var listAppointment = List<Appointment>()

    var UserId = BaseClient.shared.userId

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        listAppointment = List<Appointment>()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationTitle(title: "YOUR REQUEST")
        let nib = UINib.init(nibName: StoryboardID.RequestViewCellId, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StoryboardID.RequestViewCellId)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listAppointment.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardID.RequestViewCellId, for: indexPath) as! RequestViewCell
        
        
        
        if indexPath.row < listAppointment.count {

           cell.id = listAppointment[indexPath.row].id
            
            cell.data = listAppointment[indexPath.row]
        } else {
            // Handle non-existing object here
            print("hihi")

        }
        
        cell.delegateAccept = self
        cell.delegateDeny = self
        return cell
    }
    @IBAction func refreshData(_ sender: UIRefreshControl) {
        loadData()
        sender.endRefreshing()
        tableView.reloadData()
    }
    
    //MARK: -Load data
    private func loadData(){
        BaseClient.shared.GetListAppointment(userId: UserId!,
                                             statusId: 1,
                                             completion: {
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
extension RequestedViewController : ResquestAcceptCellDelegate{
 
    func accepted(_ data: Appointment) {
        
        BaseClient.shared.UpdateAppointment(id: data.id!,
                                            issue: data.issue!,
                                            detail: "nonnn",
                                            statusId: 2,
                                             completion: { [self]
                     (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                            let rs = value as! ResponseListAppointment

                                if rs.status == 0{
                                
                                let controller: ListAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ListAppointmentViewControllerId) as! ListAppointmentViewController
                                
                                //controller.data = data
                                self.navigationController?.pushViewController(controller, animated: true)
                                }
                                
                                                
                     })
            tableView.reloadData()
        
    }
}

extension RequestedViewController : RequestDenyCellDelegate{
    func denied(_ data: Int) {
        BaseClient.shared.UpdateAppointment(id: data ,
                                            issue: "Non",
                                            detail: "nonnn",
                                            statusId: 3,
                                             completion: { [self]
                     (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                            let rs = value as! ResponseListAppointment

                                if rs.status == 0{
                                
                                    tableView.reloadData()
            }
        })
    }
}
