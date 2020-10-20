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
    static let Authorization = "Authorization"
    
}

struct ResponseKey {
    static let StatusCode = "status"
    static let MessageCode = "message"
    static let Data = "data"
    static let AccessToken = "access_token"
    static let Authorization = "Authorization \(AccessToken)"
    static let Token = "token"
    static let User = "user"
}

enum ErrorCode: Int {
    case Success = 0
    case Fail = 1
}
