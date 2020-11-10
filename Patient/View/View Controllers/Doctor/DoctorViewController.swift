//
//  DoctorViewController.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//

import UIKit
import RealmSwift

class DoctorViewController: UITableViewController {
    
    var listDoctor = List<Doctor>()
    var listHospital = List<Hospital>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDoctor()
        loadHospital()
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listDoctor.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailTableViewCell
        
        if indexPath.row < listDoctor.count {
           cell.data = listDoctor[indexPath.row]
        } else {
            // Handle non-existing object here
            print("hihi")
        }
     
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 219
    }

    
    func loadDoctor(){
        BaseClient.shared.GetListDoctor(completion: { [self]
                                        (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                                 
                                        if(isSuccess!){
                                          let user = value as! ResponseDoctor
                                          
                                            let listTemp = user.data as List<Doctor>
                                            for item in listTemp{
                                                self.listDoctor.append(item)
                                            }
                                            self.tableView.reloadData()
                                        }
                                      
                                })
    }
    
    func loadHospital(){
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
