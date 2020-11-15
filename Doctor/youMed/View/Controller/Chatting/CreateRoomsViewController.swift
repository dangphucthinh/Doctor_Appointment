//
//  CreateRoomsViewController.swift
//  youMed
//
//  Created by thinhdang on 11/15/20.
//


import UIKit
import Firebase

class CreateRoomsViewController: UITableViewController {
    @IBOutlet weak var chatTableView:UITableView!
  
    var allUsers = [UserDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellRegistation()
       
        getAllUser()
    }
    
    func cellRegistation(){
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "detailCell")
    }
    
    //MARK:- Get All Users
    func getAllUser(){
      
        UserDataManager.getAllUsers { (allUser) in
            self.allUsers.removeAll()
            self.allUsers = allUser
            self.chatTableView.reloadData()
         
        }
    }

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return 2
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! UserCell
         
            
            if indexPath.row < allUsers.count {
                cell.lblName.text = allUsers[indexPath.row].name
            } else {
                // Handle non-existing object here
                print("hihi")
            }
            return cell
        }

        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 70
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let vc = storyboard?.instantiateViewController(identifier: StoryboardID.MessengerViewControllerId) as! MessengerViewController
            vc.recieverUser = allUsers[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
}
