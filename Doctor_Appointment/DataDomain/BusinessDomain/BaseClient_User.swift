//
//  BaseClient_User.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/15/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//
    
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

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
                        
                        let usersId = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.User)) as? NSDictionary
                        self.userId = usersId?.object(forKey: "id") as? String
                        
                        DataManager.shared.AddValue(key: Header.Authorization, value: "Bearer \(self.accessToken!)")
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
    
    /*
         * Get list doctor
         * @param: HospitalSpeciality
         * @return listData in callback
     */
    
//    func GetDoctorInfoBySpecialty(HosSpecId: String, completion:@escaping ServiceResponse) {
//            DispatchQueue.global(qos: .background).async {
//                // Run on background
//                let request = Service.GetDoctorBySpeciality(HosSpecId: HosSpecId) as URLRequestConvertible
//                Alamofire.request(request)
//                        .responseObject { (response: DataResponse<Doctor>) in
//                        switch response.result {
//                        case let .success(data):
//                            completion(true, nil, data);
//                            break
//
//                        case let .failure(error):
//                            completion(false, error as NSError?, nil);
//
//                            break
//                        }
//                }
//            }
//        }
    
    func GetUserInfo(UserId: String, completion:@escaping ServiceResponse) {
            DispatchQueue.global(qos: .background).async {
                // Run on background
                let request = Service.GetPatientInfo(UserId: UserId, token: self.accessToken!) as URLRequestConvertible
                Alamofire.request(request)
                        .responseObject { (response: DataResponse<ResponseUser>) in
                        switch response.result {
                        case let .success(data):
                            completion(true, nil, data);
                            break

                        case let .failure(error):
                            completion(false, error as NSError?, nil);
                            
                            break
                        }
                }
            }
        }
}
