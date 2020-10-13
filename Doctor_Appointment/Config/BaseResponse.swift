//
//  BaseResponse.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/12/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse<T: Mappable>: Mappable {
    var status: Int?
    var code: Int?
    var message: String?
    var accessToken: String?
    //var data: Object?

    //var data: T?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        //code <- map["token_type"]
        message <- map["message"]
        //data <- map["status"]
        accessToken <- map["access_token"]
    }
    
    func isSuccessCode() -> Bool? {
        return code == 200
    }
}


class BaseResponseError {
    var mErrorType: NetworkErrorType!
    var mErrorCode: Int!
    var mErrorMessage: String!
    
    init(_ errorType: NetworkErrorType,_ errorCode: Int,_ errorMessage: String) {
        mErrorType = errorType
        mErrorCode = errorCode
        mErrorMessage = errorMessage
    }
}
