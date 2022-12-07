//
//  ServerKey.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
//

import Foundation

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
    static let Token = "token"
    static let User = "user"
}

enum ErrorCode: Int {
    case Success = 0
    case Fail = 1
}
