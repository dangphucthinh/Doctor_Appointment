//
//  ViewController.swift
//  youMed
//
//  Created by Duy Dinh on 10/23/20.
//

import UIKit
import RealmSwift
import SDWebImage

class HomePageController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var listDoctor = List<Doctor>()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadDoctor()
       
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension HomePageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 1){
            return 1
        }
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if listDoctor.count >= 0{
           return 3
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "specialistCell") as! SpecialistTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailTableViewCell
            
            if indexPath.row < listDoctor.count {
               cell.data = listDoctor[indexPath.row]
            } else {
                // Handle non-existing object here
                print("hihi")
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 0
        case 1:
            return 200
        default:
            return 219
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("hihihehe")
        let controller: ViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ViewControllerId) as! ViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as! HeaderView
            return header
        }
        return UITableViewHeaderFooterView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 130
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Specialist"
        case 2:
            return "Doctor"
        default:
            return ""
        }
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

