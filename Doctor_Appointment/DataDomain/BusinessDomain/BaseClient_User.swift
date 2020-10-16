//
//  BaseClient_User.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/15/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

//extension BaseClient{
//
//    static func isConnectedToInternet() ->Bool {
//        return NetworkReachabilityManager()!.isReachable
//    }
//
//    static func request<T: Mappable>(_ apiRouter: BaseClient.Service,_ returnType: T.Type, completion: @escaping (_ result: T?, _ error: BaseResponseError?) -> Void) {
//        if !isConnectedToInternet() {
//            // Xử lý khi lỗi kết nối internet
//            return
//        }
//
//    }}
    
extension BaseClient {
    
    /**
    * Login
    * @param: username, password md5
    * @return : token
    */

    func loginWithUrl(username:String, password: String, completion:@escaping ServiceResponse) {
        DispatchQueue.global(qos: .background).async {
            
            // Run on background thread
            let request = Service.login(username: username, password: password) as URLRequestConvertible
            Alamofire.request(request)
                .responseJSON { ( response : DataResponse <Any>) in
                
                switch response.result {
                case .success (_):
                    
                    
                    let data = response.result.value as? NSDictionary
                    let errorKey = data?.object(forKey: ResponseKey.StatusCode) as? Int
                    let rawValue = data?.object(forKey: ResponseKey.Data)
                    
                    if ( errorKey == ErrorCode.Success.rawValue) {
                            // Login succes
                        let access_token = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.Token)) as? NSDictionary
                        self.accessToken = access_token?.object(forKey: ResponseKey.AccessToken) as? String
                        DataManager.shared.AddValue(key: Header.Authorization, value: "Bearer" + self.accessToken!)
                        DispatchQueue.main.async {
                            // Run on main thread
                            completion(true, nil, data as AnyObject);
                        }
                        
                        
                    } else {
                        // Login fail
                        let message = String(format: "\(rawValue as? String ?? Message.LoginFailMessage)")
                        
                        let error = NSError(domain: Service.baseHTTP,
                                            code: 0,
                                            userInfo: [NSLocalizedDescriptionKey :message])
                        DispatchQueue.main.async {
                            // Run on main thread
                            completion(false, error, nil);
                        }
                    }
                        break
                    case .failure(let error):
                        DispatchQueue.main.async {
                            // Run on main thread
                            completion(false, error as NSError?, nil);
                        }
                        break
                }
            }
        }
    }
}


