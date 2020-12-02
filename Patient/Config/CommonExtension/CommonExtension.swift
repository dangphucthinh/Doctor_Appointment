//
//  CommonExtension.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
//

import Foundation
import UIKit

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
    
//    //Covert date to string
//    func dateToSQLDate(_ DateString: String) -> String {
//        var returnDate = ""
//        let dateFormatter = DateFormatter()
//       // dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        let string = String(DateString)
//        if let date = dateFormatter.date(from: string) {
//        dateFormatter.dateFormat = "MM/dd/yyyy"
//           returnDate = dateFormatter.string(from: date)
//        }
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
//        return returnDate
//    }
//    
//    //convert string to date
//    func stringToDate(_ str: String)->Date{
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd/yyyy"
//        return formatter.date(from: str)!
//    }
}

extension UIImageView{
    func roundedImageView(){
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = .systemBlue
    }
}


