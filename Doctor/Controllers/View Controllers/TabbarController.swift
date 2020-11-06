//
//  TabbarController.swift
//  youMed
//
//  Created by Duy Dinh on 10/24/20.
//

import UIKit

class TabbarController: UIViewController {

    let tabbarController = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createTabbarController()
    }
    
    func createTabbarController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let scheduleVC = storyboard.instantiateViewController(withIdentifier: StoryboardID.HomePageControllerId)
        let userVC = storyboard.instantiateViewController(identifier: StoryboardID.UserInformationControllerId)
        
        scheduleVC.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(named: "calendar"), tag: 0)
        userVC.tabBarItem = UITabBarItem(title: "User", image: UIImage(systemName: "person.fill"), tag: 1)
        
        let tabbarList = [scheduleVC, userVC]
        tabbarController.viewControllers = tabbarList
        
        self.view.addSubview(tabbarController.view)
    }
}
