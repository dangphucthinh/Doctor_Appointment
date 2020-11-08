//
//  MenuViewController.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 11/7/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "UserHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        self.navigationController?.isNavigationBarHidden = true
//    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.tintColor = .systemBlue
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Home"
            cell.imageView?.image = UIImage(systemName: "house.fill")
        case 1:
            cell.textLabel?.text = "Account"
            cell.imageView?.image = UIImage(systemName: "person.fill")
        case 2:
            cell.textLabel?.text = "Your Request"
            cell.imageView?.image = UIImage(systemName: "building.2.fill")
        case 3:
            cell.textLabel?.text = "Upcoming"
            cell.imageView?.image = UIImage(systemName: "creditcard.fill")
        case 4:
            cell.textLabel?.text = "Wallet"
            cell.imageView?.image = UIImage(systemName: "wallet.pass.fill")
        case 5:
            cell.textLabel?.text = "Messages"
            cell.imageView?.image = UIImage(systemName: "envelope.fill")
        case 6:
            cell.textLabel?.text = "Setting"
            cell.imageView?.image = UIImage(systemName: "gearshape.fill")
        case 7:
            cell.textLabel?.text = "Logout"
            cell.imageView?.image = UIImage(systemName: "arrowshape.turn.up.left.fill")
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerView") as! UserHeaderView
        headerView.contentView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 0:
            print("a")
        case 1:
            print("b")
        case 2:
            print("c")
            let controller: ListAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ListAppointmentViewControllerId) as! ListAppointmentViewController
            //controller.stringb = deliveryTimes[self.timePicker.selectedRow(inComponent: 0)]

            self.navigationController?.pushViewController(controller, animated: true)
        case 3:
            print("d")
            
            let controller: RequestedViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.RequestedViewControllerId) as! RequestedViewController
            
            self.navigationController?.pushViewController(controller, animated: true)
        case 4:
            print("e")
        case 5:
            print("f")
        case 6:
            print("g")
            
        case 7:
            let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignInControllerId) as! SignInController
            
            self.navigationController?.pushViewController(controller, animated: true)
            print("cccc")
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }

}
