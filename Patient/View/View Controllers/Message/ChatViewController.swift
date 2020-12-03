//
//  ChatViewController.swift
//  youMed
//
//  Created by thinhdang on 11/9/20.
//
import UIKit

class ChatViewController: UIViewController {

    let messagesTableView: UITableView = {
        let messagesTableView = UITableView()
        messagesTableView.register(MessagesViewCell.self, forCellReuseIdentifier: "cellId")
        messagesTableView.translatesAutoresizingMaskIntoConstraints = false
        messagesTableView.isScrollEnabled = true
        
        
        return messagesTableView
    }()
    
    private let pageTitle: UILabel = {
        let pageTitle = UILabel()
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        pageTitle.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        
        let attributedText = NSMutableAttributedString(string: "Smart A.I. Chat", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])
        
        pageTitle.attributedText = attributedText
        return pageTitle
    }()
    
    var messagesArray = [
        MessageModel(content: "Hey What's Up, Ask me Something. I'm Super Smart", id: "agent")
    ]
    
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageField: UITextField!
    
    @IBAction func sendBtnClicked(_ sender: Any) {
        if messageField.text != nil && messageField.text != "" {
            queryResponse(query: messageField.text!)
            BaseClient.shared.Chatbot(data: messageField.text!,
                                      completion: {
                              (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                                       
            let rs = value as! ResponseChatbot
                                        if rs.status == 0{
                                         print("true")
                                        }
                            
        })
           messagesArray.append(MessageModel(content: messageField.text!, id: "user"))
           messagesTableView.reloadData()
           messageField.text = ""
    }
            
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageField.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        messagesTableView.separatorStyle = .none
        messagesTableView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        messagesTableView.rowHeight = UITableView.automaticDimension
        messagesTableView.estimatedRowHeight = 200
        
        view.addSubview(messagesTableView)
        view.addSubview(pageTitle)
        
        messagesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        messagesTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        messagesTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        messagesTableView.bottomAnchor.constraint(equalTo: messageField.topAnchor, constant: -20).isActive = true
        
        pageTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        pageTitle.bottomAnchor.constraint(equalTo: messagesTableView.topAnchor, constant: -18).isActive = true
        
        //listen textfield events
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
        if messageField.isEditing{
            view.frame.origin.y = -300
        }else{
            view.frame.origin.y = 0
        }
    }
    
    func queryResponse(query: String) {
        
      BaseClient.shared.Chatbot(data: messageField.text!,
                                completion: { [self]
            (isSuccess: Bool?, error: NSError?, value: AnyObject?) in
                                             
                        let rs = value as! ResponseChatbot
                        if rs.status == 0{
                            if let speech = rs.data {
                                   self.messagesArray.append(MessageModel(content: speech, id: "agent"))
                                   self.messagesTableView.reloadData()
                                   print(speech)
                                   
                               }
                        }
        })
    }
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 40
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MessagesViewCell
        
        let message = messagesArray[indexPath.row]
        cell.message = message
        cell.backgroundColor = .clear
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension ChatViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboardWhenTappedAround()
        textField.resignFirstResponder()
        view.frame.origin.y = 0
        return true
    }
}

  




