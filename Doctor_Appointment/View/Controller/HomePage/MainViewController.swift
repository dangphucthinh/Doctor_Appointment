//
//  MainViewController.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "headerView")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath)
        
            cell.textLabel?.text = "General Practice"
            cell.detailTextLabel?.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit"
            cell.imageView?.image = UIImage(named: "generalPractice")
            cell.imageView?.backgroundColor = .systemBlue
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialistCell", for: indexPath)
            
            cell.textLabel?.text = "Specialist"
            cell.detailTextLabel?.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit"
            cell.imageView?.image = UIImage(named: "specialist")
            cell.imageView?.backgroundColor = .systemBlue
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DentistCell", for: indexPath)
            
            cell.textLabel?.text = "Dentist"
            cell.detailTextLabel?.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit"
            cell.imageView?.image = UIImage(named: "dentist")
            cell.imageView?.backgroundColor = .systemBlue
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CallCenterCell", for: indexPath)
            
            cell.textLabel?.text = "Call Center"
            cell.detailTextLabel?.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit"
            cell.imageView?.image = UIImage(named: "callCenter")
            cell.imageView?.backgroundColor = .systemBlue
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
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
}
