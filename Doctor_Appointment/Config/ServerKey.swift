//
//  ServerKey.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/12/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire

struct Header {
    static let ContentType = "Content-Type"
    static let ApplicationJson = "application/json"
    static let AccessTokenKey = "Access-Token"
    static let Authorization = "Bearer \(AccessTokenKey)"
}

struct Body {
    
}

struct ResponseKey {
    static let StatusCode = "status"
    static let MessageCode = "message"
    static let Data = "data"
    static let AccessToken = "access_token"
}
enum ErrorCode: Int {
    case Success = 0
    case Fail = 1
}
