//
//  UserViewController.swift
//  youMed
//
//  Created by Duy Dinh on 10/29/20.
//

import UIKit

class UserInformationController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data : Doctor?
    var leftBarButtonItem : UIBarButtonItem!
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.showNavigationBar(animated: animated)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBarLogo(title: "INFORMATION", controlEvents: .touchUpInside,
        ForAction:{() -> Void in
            // Search action
            print("Search")
        })

        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "UserHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
    }
    
}

extension UserInformationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
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
            cell.imageView?.image = UIImage(systemName: "exclamationmark.bubble.fill")
        case 3:
            cell.textLabel?.text = "Upcoming"
            cell.imageView?.image = UIImage(systemName: "creditcard.fill")
        case 4:
            cell.textLabel?.text = "Messages"
            cell.imageView?.image = UIImage(systemName: "envelope.fill")
        case 5:
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
   
            print("cc")
        switch indexPath.row {
        case 0:
            print("abc")
            let controller: CreateRoomsViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.CreateRoomsViewControllerId) as! CreateRoomsViewController
            

            self.navigationController?.pushViewController(controller, animated: true)
        case 1:
   
            let controller: InfomationViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.InfomationViewControllerId) as! InfomationViewController
            

            self.navigationController?.pushViewController(controller, animated: true)
        case 2:
            let controller: ListAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ListAppointmentViewControllerId) as! ListAppointmentViewController
          
            controller.statusId = 1
            self.navigationController?.pushViewController(controller, animated: true)
        case 3:
          
            let controller: ListAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ListAppointmentViewControllerId) as! ListAppointmentViewController
            controller.statusId = 2

            self.navigationController?.pushViewController(controller, animated: true)
        case 4:
            print("e")
            
            let controller: ChatViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ChatViewControllerId) as! ChatViewController
          

            self.navigationController?.pushViewController(controller, animated: true)
        case 5:
            print("g")
            let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignInControllerId) as! SignInController
            
            self.navigationController?.pushViewController(controller, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }
}
