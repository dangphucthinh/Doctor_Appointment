//
//  ServerKey.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire

struct Header {
    static let ContentType = "Content-Type"
    static let ApplicationJson = "application/json"
    //static let AccessTokenKey = "Access-Token"
    static let Authorization = "Authorization"
    
}

struct Body {
    
}

struct ResponseKey {
    static let StatusCode = "status"
    static let MessageCode = "message"
    static let Data = "data"
    static let AccessToken = "access_token"
    static let Authorization = ""
}
enum ErrorCode: Int {
    case Success = 0
    case Fail = 1
}
