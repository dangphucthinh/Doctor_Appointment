//
//  SignInController.swift
//  youMed
//
//  Created by thinhdang on 11/7/20.
//


import UIKit
import AlamofireObjectMapper
import Alamofire
class SignInController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lbNameValidated: UILabel!
    @IBOutlet weak var lbPassValidated: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
   
    }
    
    private func configureTextFields(){
        tfUsername.delegate = self
        tfPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SignUpControllerId) as! SignUpController
        
        self.present(controller,animated: true)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(identifier: StoryboardID.SendEmailViewControllerId) as! SendEmailViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func name_act(_ sender: Any){
        let text = tfUsername.text ?? ""
        if text.isValidName{
            tfUsername.textColor = UIColor.link
            lbNameValidated.text = ""
        }else{
            tfUsername.textColor = UIColor.red
            lbNameValidated.text = "Your username is invalid"
        }
    }
    
    @IBAction func password_act(_ sender: Any){
        let text = tfPassword.text ?? ""
        if text.isValidPassword{
            tfPassword.textColor = UIColor.link
            lbNameValidated.text = ""
        }else{
            tfPassword.textColor = UIColor.link
            lbPassValidated.text = "Your password is invalid"
        }
    }
   
    @IBAction func signIn(_ sender: Any) {
        if(!tfUsername.text!.isEmpty && !tfPassword.text!.isEmpty) {
            Loading.showLoading(message: Message.LoadingMessage, view: self.view)
            BaseClient.shared.loginWithUrl(username: tfUsername.text!,
                                           password: tfPassword.text!)
            { (isSuccess:Bool?, error:NSError?, value:AnyObject?) in
                Loading.dismissLoading()

                if(isSuccess!) {
                    
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
                    
                    //switch to parentViewController
                    self.resetRoot(id: StoryboardID.ParentViewControllerId)
                        }
                else {
                    // Show message login fail
                    // create the alert
                let alert = UIAlertController(title: "My Title", message: "Login Fail", preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
                }
            }
        }
    
    }
}

extension SignInController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
