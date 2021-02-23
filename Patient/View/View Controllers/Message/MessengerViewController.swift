//
//  MessengerViewController.swift
//  youMed
//
//  Created by Oscar on 11/12/20.
//

import UIKit
import Firebase

class MessengerViewController: UIViewController {

    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    var sendUserId = BaseClient.shared.userId
    var receivedUserId : String?
    var allmessages = [MessageDataModel]()
    var recieverUser : UserDataModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldValidation()
        self.title = recieverUser?.name
        getAllMessages()
        txtMessage.delegate = self
        //listen for keyboard events
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification:NSNotification) {
        if txtMessage.isEditing {
            view.frame.origin.y = -300
        }else{
            view.frame.origin.y = 0
        }
    }
    
    func getAllMessages(){
        MessageDataManager.getAllMessagesInConversation(thread: (recieverUser?.userId)! + sendUserId!) { (messages) in
            self.allmessages = messages
            self.messageTableView.reloadData()
           
            if self.allmessages.count != 0{
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1, execute: {
                    let indexPath = IndexPath(row: self.allmessages.count-1, section: 0)
                    self.messageTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
                })
            }
        }
    }

    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSend(_ sender: Any) {
        let name = BaseClient.shared.fullName
        let email = BaseClient.shared.email
        let avatar = BaseClient.shared.avatar
        let id = BaseClient.shared.userId
        //send user to firebase
        let userData = UserDataModel(Uname: name ?? "Not found",
                                     Uemail: email ?? "Not found",
                                     Uavatar: avatar ?? "User",
                                     UuserId: id ?? "Not found" )
        UserDataManager.setUserData(userData: userData, userId: id ?? "Not found")
        
        let messageData = MessageDataModel(msg: txtMessage.text!, rvrId: (recieverUser?.userId)!, sndrId: sendUserId!)
        MessageDataManager.setMessage(thread: (recieverUser?.userId)! + sendUserId!, messageData: messageData)
        txtMessage.text = ""
    }
}

extension MessengerViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allmessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingCell", for: indexPath) as! ChattingCell
        if allmessages[indexPath.row].senderId == sendUserId{
            cell.setMessageType(type: .outgoing)
        }
        else{
            cell.setMessageType(type: .incoming)
        }
        cell.txtMessage.text = allmessages[indexPath.row].message
        return cell
    }
}

extension MessengerViewController{
    func textFieldValidation(){
        btnSend.isEnabled = false
        txtMessage.addTarget(self, action: #selector(textDidChange(_sender:)), for: .editingChanged)
    }
    
    @objc func textDidChange(_sender:UITextField){
        if txtMessage.text?.count == 0 && txtMessage.text == ""{
            btnSend.alpha = 0.5
            btnSend.isEnabled = false
        }
        else{
            btnSend.alpha = 1
            btnSend.isEnabled = true
        }
    }
}

extension MessengerViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboardWhenTappedAround()
        textField.resignFirstResponder()
        view.frame.origin.y = 0
        return true
    }
}
