//
//  CreateRoomsViewController.swift
//  youMed
//
//  Created by Oscar on 11/12/20.
//

import UIKit
import Firebase

class CreateRoomsViewController: UIViewController {

    var ref = DatabaseReference.init()
    var rooms = [Room]()
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var messageField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ref = Database.database().reference()
        
        LoginAnonymous()
    }
    

    @IBAction func switchToChat(_ sender: UIButton) {
        self.messageField.resignFirstResponder()
        let dic = ["text" : messageField.text!,
        "name" : "Oscar"] as [String: Any]
        self.ref.child("messenger").childByAutoId().setValue(dic)
    }
    
    func LoginAnonymous(){
        FirebaseAuth.Auth.auth().signInAnonymously(){
            (authResult, error) in
              // ...
            guard let user = authResult?.user else { return }
            let isAnonymous = user.isAnonymous  // true
            let uid = user.uid
            
            print(isAnonymous)
            print(uid)
        }
    }
    
}
