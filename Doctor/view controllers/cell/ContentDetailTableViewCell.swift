//
//  ContentDetailTableViewCell.swift
//  youMed
//
//  Created by Duy Dinh on 10/26/20.
//

import UIKit
import RealmSwift
import SDWebImage

class ContentDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    var listDoctor = List<Doctor>()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")

    }
    
    
    func loadDoctor(controller: ScheduleVC){
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

extension ContentDetailTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailTableViewCell
        //let a = listDoctor[indexPath.row]
        //print(doctor.fullName as Any)
        
//        let ava: String? = doctor.avatar
//        let url = URL.init(string: "\(ava!)")
//
//        cell.doctorImage?.sd_setImage(with: url, placeholderImage: UIImage(named: "no_image_banner"))
//        cell.doctorNameLabel.text = doctor.fullName
//        cell.specialistLabel.text = doctor.specialtyName
//        cell.addressLabel.text = doctor.education
    
//        cell.doctorNameLabel.text = doctor.fullName
//        print(listDoctor[indexPath.row].fullName!)
//        cell.specialistLabel.text = "cailol"
//        cell.addressLabel.text = "concac"
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        219
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}
