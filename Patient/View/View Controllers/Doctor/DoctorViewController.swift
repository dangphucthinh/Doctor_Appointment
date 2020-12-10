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
    var searchDoctor : Bool = false
    var isHospital : Bool = false
    var isSpecial: Bool = false
    var searchPhrase : String?
    var hospitalId : Int?
    var specialHospital: String?
    var isAdvise : Bool = false
    var spec: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDoctor()
        cellRegister()
        self.navigationTitle(title: "DOCTOR")
        listDoctor = List<Doctor>()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listDoctor = List<Doctor>()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        listDoctor = List<Doctor>()
    }
    
    func cellRegister(){
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
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 219
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let controller: DoctorInfoViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.DoctorInfoViewControllerId) as! DoctorInfoViewController
        
        controller.data = listDoctor[indexPath.row]
        
        self.navigationController?.pushViewController(controller, animated: true)
    }

    
    func loadDoctor(){
      
        if searchDoctor == true {
            BaseClient.shared.SearchDoctor(searchPhrase: searchPhrase!,
                                           completion: { [self]
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
        
       else if isHospital == true {
            BaseClient.shared.getDoctorByHospital(Id: hospitalId!,
                                           completion: { [self]
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
        
       else if isSpecial == true {
            BaseClient.shared.getDoctorBySpecialty(HosSpecName: specialHospital!,
                                                   completion: { [self]
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
       
       else if isAdvise == true {
        BaseClient.shared.getDoctorBySpecialty(HosSpecName: spec!,
                                               completion: { [self]
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
        else {
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
}
  


extension DoctorViewController : DetailTableViewCellProtocol{
    func doctorPage(_ data: Doctor) {
        let controller: MakeAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.MakeAppointmentViewControllerId) as! MakeAppointmentViewController

        controller.doctorId = data.id!
        controller.doctor = data
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
    



