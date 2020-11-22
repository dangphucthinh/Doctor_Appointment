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
    

    var allUsers = [UserDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDoctor()
        cellRegister()
        getAllUser()
        
//        let userData = UserDataModel(Uname: "phucthinh dang", Uemail: "dangthinh@gmail.com", Uavatar: "http://res.cloudinary.com/deh0sqxwl/image/upload/v1603946649/kysbc6aamvwi8mkrklni.png", UuserId: "3bae1afc-ff29-421f-b80e-53a76635da0a")
//        UserDataManager.setUserData(userData: userData, userId: "3bae1afc-ff29-421f-b80e-53a76635da0a")
    }
    
    func cellRegister(){
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
    }
    
    
    //MARK:- Get All Users
    func getAllUser(){
        UserDataManager.getAllUsers { (allUser) in
            self.allUsers.removeAll()
            self.allUsers = allUser
            self.tableView.reloadData()
        }
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let controller: DoctorProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorProfileViewControllerId) as! DoctorProfileViewController
        
        controller.data = listDoctor[indexPath.row]
        
        self.navigationController?.pushViewController(controller, animated: true)
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
    


}
