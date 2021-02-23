//
//  BaseConnection.swift
//  youMed
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class BaseConnection {
    
    static func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func request<T: Mappable>(_ apiRouter: BaseClient.Service,_ returnType: T.Type, completion: @escaping (_ result: T?, _ error: BaseResponseError?) -> Void) {
        if !isConnectedToInternet() {
            // Xử lý khi lỗi kết nối internet
            return
        }
        
        Alamofire.request(apiRouter).responseObject {(response: DataResponse<BaseResponse<T>>) in
            switch response.result {
            case .success:
                print(response.result)
                if response.response?.statusCode == 200 {
                                    if (response.result.value?.isSuccessCode())! {
                                        completion((response.result.value?.data), nil)
                                        print(response.result.value?.data! as Any)
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
                    let err: BaseResponseError = BaseResponseError.init(NetworkErrorType.HTTP_ERROR, error._code, "Request is failure!")
                    completion(nil, err)
                }
                
                break
            }
        }
    }
}

