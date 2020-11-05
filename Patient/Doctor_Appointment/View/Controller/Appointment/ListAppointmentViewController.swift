//
//  ListAppointmentViewController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 11/5/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class ListAppointmentViewController: UITableViewController {
    
    var name = "cac"
    var phone = "cacacac"

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardID.AppointmentTableCellId, for: indexPath) as? AppointmentTableCell

        // Configure the cell...
        cell?.commonInit(name, phone)

        return cell!
    }
}

