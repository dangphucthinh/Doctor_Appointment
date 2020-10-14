//
//  BaseUrl.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation

struct API{
    static let kBaseUrl = "http://116.110.87.119:2904/"
    static let kPatientUrl = "http://116.110.87.119:2904/api/Auth"
    static let kDoctorUrl = "http://116.110.87.119:2904/api/Doctor"
    
    static let kLoginUrl = "Auth/Login"
    static let kRegisterUrl = "api/Auth/Register"
    static let kLogin = "api/Auth/Login"
    static let kChangePassword = "api/Auth/ChangePassword"
}

enum NetworkErrorType {
    case API_ERROR
    case HTTP_ERROR
}
