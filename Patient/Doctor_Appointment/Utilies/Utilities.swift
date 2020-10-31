//
//  Utilities.swift
//  Doctor_Appointment
//
//  Created by thinhdang on 10/25/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    private init() {}
    static func isValidField(name: String, phone: String, email: String, password: String) -> Bool {
        if(!name.isValidName){
            return false;
        }
        else if (!password.isValidPassword){
            return false;
        }
        else if(!email.isValidEmail){
            return false;
        }
        else if(!phone.isValidPhone){
            return false;
        }
        else {
            return true;
        }
    }
    
    static func getInvalidField(name: String,
                                phone: String,
                                email: String,
                                password: String,
                                field: [String: UITextField]) -> UITextField {
        if(!name.isValidName){
            return field["name"]!
        }
        else if (!password.isValidPassword){
            return field["password"]!
        }
        else if(!email.isValidEmail){
            return field["email"]!
        }
        else if (!phone.isValidPhone){
            return field["phone"]!
        }
        return field["name"]!
    }
    
    static func isValidationField(fieldName: UITextField,
                                fieldPhone: UITextField,
                                fieldEmail: UITextField,
                                fieldPassword: UITextField) ->Bool {
        
        let dictField: [String: UITextField] = ["name": fieldName,
                        "phone": fieldPhone,
                        "email": fieldEmail,
                        "password": fieldPassword]
                        
        if(Utilities.isValidField(name: fieldName.text!,
                                  phone: fieldPhone.text!,
                                  email: fieldEmail.text!,
                                  password: fieldPassword.text! )) {
            // Valid
            return true;
        } else {
            // Invalid
            let invalidField = Utilities.getInvalidField(name: fieldName.text!,
                                                        phone: fieldPhone.text!,
                                                        email: fieldEmail.text!,
                                                        password: fieldPassword.text!,
                                                         field: dictField)
            invalidField.layer.borderColor = UIColor.red.cgColor;
            invalidField.layer.borderWidth = 3.0;
            
            return false;
        }
    }
    
}
