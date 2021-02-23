//
//  WelcomeViewController.swift
//  youMed
//
//  Created by thinhdang on 11/7/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func signUp(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignUpControllerId) as! SignUpController
         
         self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignInControllerId) as! SignInController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
