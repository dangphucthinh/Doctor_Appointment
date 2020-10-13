//
//  BaseConnection.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/12/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class BaseConnection {
    
    static func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func request<T: Mappable>(_ apiRouter: BaseClient.APIRouter,_ returnType: T.Type, completion: @escaping (_ result: T?, _ error: BaseResponseError?) -> Void) {
        if !isConnectedToInternet() {
            // Xử lý khi lỗi kết nối internet
            return
        }
        
        Alamofire.request(apiRouter).responseObject {(response: DataResponse<BaseResponse<T>>) in
            switch response.result {
            case .success:
                if response.response?.statusCode == 200 {
                                    if (response.result.value?.isSuccessCode())! {
                                        completion((response.result.value?.accessToken)! as? T, nil)
                                    } else {
                                        let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.API_ERROR, (response.result.value?.status)!, (response.result.value?.message)!)
                                        completion(nil, err)
                                    }
                                } else {
                                    let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, (response.response?.statusCode)!, "Request is error!")
                                    completion(nil, err)
                                }
                                break
            case .failure(let error):
                if error is AFError {
                    let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is Failure!")
                    completion(nil, err)
                }
                
                break
            }
        }
    }
}
