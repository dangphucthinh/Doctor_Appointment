//
//  ParentViewController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 9/7/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func signUp(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.InfomationViewControllerId) as! InfomationViewController
         
         self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignInControllerId) as! SignInController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
