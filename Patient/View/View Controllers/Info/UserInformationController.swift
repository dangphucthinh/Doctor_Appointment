//
//  UserViewController.swift
//  youMed
//
//  Created by thinhdang on 10/29/20.
//

import UIKit

class UserInformationController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.showNavigationBar(animated: animated)
        tableView.reloadData()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBarLogo(title: "INFORMATION", controlEvents: .touchUpInside,
        ForAction:{() -> Void in
            // Search action
        })

        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "UserHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
        tableView.reloadData()
    }
    
}

extension UserInformationController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.tintColor = .systemBlue
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Chatting"
            cell.imageView?.image = UIImage(systemName: "message.fill")
        case 1:
            cell.textLabel?.text = "Profile"
            cell.imageView?.image = UIImage(systemName: "person.fill")
        case 2:
            cell.textLabel?.text = "Your Request"
            cell.imageView?.image = UIImage(systemName: "exclamationmark.bubble.fill")
        case 3:
            cell.textLabel?.text = "Schedule"
            cell.imageView?.image = UIImage(systemName: "creditcard.fill")
        case 4:
            cell.textLabel?.text = "History"
            cell.imageView?.image = UIImage(systemName: "doc.on.clipboard.fill")
        case 5:
            cell.textLabel?.text = "Messages"
            cell.imageView?.image = UIImage(systemName: "envelope.fill")
        case 6:
            cell.textLabel?.text = "Settings"
            cell.imageView?.image = UIImage(systemName: "wrench.fill")
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
        headerView.LoadInform(UserId: BaseClient.shared.userId!)
        return headerView 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
   

        switch indexPath.row {
        case 0:
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
            let controller: CustomCalendarExampleController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.CustomCalendarExampleControllerId) as! CustomCalendarExampleController
            controller.statusId = 2

            self.navigationController?.pushViewController(controller, animated: true)
        case 4:
            print("a")
            let controller: ListAppointmentViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ListAppointmentViewControllerId) as! ListAppointmentViewController
            controller.statusId = 4

            self.navigationController?.pushViewController(controller, animated: true)
        case 5:
            let controller: ChatViewController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID.ChatViewControllerId) as! ChatViewController
            self.navigationController?.pushViewController(controller, animated: true)
        case 6:
            let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.ChangePasswordControllerId) as! ChangePasswordController
            self.navigationController?.pushViewController(controller, animated: true)
        case 7:
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
