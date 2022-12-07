//
//  HospitalViewController.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//

import UIKit
import RealmSwift

class HospitalViewController: UITableViewController {

    
    var listHospital = List<Hospital>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDoctor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.register(UINib(nibName: "HospitalTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listHospital.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! HospitalTableViewCell
        
        if indexPath.row < listHospital.count {
           cell.data = listHospital[indexPath.row]
        } else {
            // Handle non-existing object here
            print("hihi")
        }
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller: DoctorViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorViewControllerId) as! DoctorViewController
        controller.hospitalId = listHospital[indexPath.row].id
        controller.isHospital = true
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 219
    }

    
    func loadDoctor(){
        BaseClient.shared.GetListHospital(completion: { [self]
                                        (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                                 
                                        if(isSuccess!){
                                          let user = value as! ResponseListHospital
                                          
                                            let listTemp = user.data as List<Hospital>
                                            for item in listTemp{
                                                self.listHospital.append(item)
                                            }
                                            self.tableView.reloadData()
                                        }
                                      
                                })
    }
}
