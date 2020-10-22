//
//  TestViewController.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/21/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var f: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var fullname: UILabel!
    
    var UserId = BaseClient.shared.userId
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadInform(UserId: UserId!)
        // Do any additional setup after loading the view.
    }
    
    func LoadInform(UserId :String){
        BaseClient.shared.GetUserInfo(UserId: UserId,
                                      completion: {
              (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                        let rs = value as! ResponseUser
                                        print(rs as Any)
              if(isSuccess!){
                  let rsMovie = value as! ResponseUser

             //   self.name.text = rsMovie.data?.fullName;
                self.phone.text = rsMovie.data?.fullName;
                self.f.text = rsMovie.data?.fullName;
                self.fullname.text = "cac"
               
              }
            
      })
    }
}
