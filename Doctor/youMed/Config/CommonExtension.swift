//
//  CommonExtension.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/22/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    func initController(id: String) -> UIViewController {
        return (storyboard?.instantiateViewController(withIdentifier: id))!
    }
    
    func resetRoot(id: String) {
        guard let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id) as? UIViewController
        else {
            return
        }
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
        
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setNavigationBarLogo(title: String, controlEvents control :UIControl.Event, ForAction action:@escaping () -> Void) {
        
        // Logo in center
//        let logo = UIImage(named: Resources.kHomeMovieLogo)
//        let imageView = UIImageView(image: logo)
//        imageView.contentMode = .scaleAspectFill
//        self.navigationItem.titleView = imageView
        
//        let logoImage = UIImage.init(named: Resources.kHomeMovieLogo)
//        let logoImageView = UIImageView.init(image: logoImage)
//        logoImageView.frame = CGRect(x: 0, y: 0, width: 150, height: 25)
//        logoImageView.contentMode = .scaleAspectFit
        
        // Title in left
        let titleFrame = CGRect(x: 0, y: 0, width: (self.navigationController?.navigationBar.frame.width)!/2, height: (self.navigationController?.navigationBar.frame.height)!)
        let labelTitle = UILabel(frame: titleFrame)
        labelTitle.textColor = .white
        labelTitle.text = title.uppercased()
        labelTitle.font = UIFont.boldSystemFont(ofSize: 18)
        let imageItem = UIBarButtonItem.init(customView: labelTitle)
        let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -25
        navigationItem.leftBarButtonItems = [negativeSpacer, imageItem]
        
        // Search in right
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.setImage(UIImage.init(named: Resources.kHomeLogo), for: .normal)
      
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)

        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    func navigationTitle(title: String) -> Void {
        self.navigationItem.title = title
          let navBar = self.navigationController?.navigationBar

            // change the bar tint color to change what the color of the bar itself looks like
            navBar?.barTintColor = UIColor.systemBlue

            // tint color changes the color of the nav item colors eg. the back button
            navBar?.tintColor = UIColor.white
            
            // the following attribute changes the title color
            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }

    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController!.navigationBar.tintColor = UIColor.white
    }
}

extension UITableViewController{
    
//    func navigationTitle(title: String) -> Void {
//        self.navigationItem.title = title
//          let navBar = self.navigationController?.navigationBar
//
//            // change the bar tint color to change what the color of the bar itself looks like
//            navBar?.barTintColor = UIColor.systemBlue
//
//            // tint color changes the color of the nav item colors eg. the back button
//            navBar?.tintColor = UIColor.white
//
//            // the following attribute changes the title color
//            navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//
//    }
}

extension UIView {
    func roundedView(cornerRadius: CGFloat?, borderWidth: CGFloat?, borderCorlor: CGColor?) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = borderCorlor
    }
}

extension UIImageView{
    func roundedImageView(){
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = .systemBlue
    }
}


extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        datePicker.datePickerMode = .date //2
        self.inputView = datePicker //3
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) //4
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) //7
        toolBar.setItems([cancel, flexible, barButton], animated: false) //8
        self.inputAccessoryView = toolBar //9
        
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}





