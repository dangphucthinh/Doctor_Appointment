//
//  ViewExtension.swift
//  youMed
//
//  Created by Oscar on 11/30/20.
//

import Foundation
import UIKit

extension UIView{
    
    //Tap gesture
    private struct OnClickHolder {
        static var _closure:()->() = {}
    }

    private var onClickClosure: () -> () {
        get { return OnClickHolder._closure }
        set { OnClickHolder._closure = newValue }
    }


    func onClick(target: Any, _ selector: Selector) {
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: selector)
        addGestureRecognizer(tap)
    }

    func onClick(closure: @escaping ()->()) {
        self.onClickClosure = closure

        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClickAction))
        addGestureRecognizer(tap)
    }

    @objc private func onClickAction() {
        onClickClosure()
    }
    
    //round view
    func roundedView(cornerRadius: CGFloat?, borderWidth: CGFloat?, borderCorlor: CGColor?) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius ?? 0
        self.layer.borderWidth = borderWidth ?? 0
        self.layer.borderColor = borderCorlor
    }
    
    //dateToSQLDate
    func dateToSQLDate(_ DateString: String) -> String {
        var returnDate = ""
        let dateFormatter = DateFormatter()
       // dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let string = String(DateString)
        if let date = dateFormatter.date(from: string) {
        dateFormatter.dateFormat = "MM/dd/yyyy"
           returnDate = dateFormatter.string(from: date)
        }
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return returnDate
    }
    
    func shadow(){
        // shadow
        self.layer.shadowColor = UIColor.link.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
    }
}
