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
    
    //MARK: -Login
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
                        
                        let full_name = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.User)) as? NSDictionary
                        self.fullName = full_name?.object(forKey: "fullName") as? String
                        
                        let user_Id = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.User)) as? NSDictionary
                        self.userId = user_Id?.object(forKey: "id") as? String
                        
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
    
    
    //MARK: -Update profile
    /*
         * Post update profile
         * @param: UserId, LastName, FirstName, Gender, Avatar, MedicalHistory, Allergy, Symptom
         * @return info of user
     */
    
//    func UpdateProfile(UserId: String,
//                       FirstName: String,
//                       LastName: String,
//                       Gender: Bool,
//                       Avatar: UIImage?,
//                       MedicalHistory: String,
//                       Allergy: String,
//                       Symptom: String,
//                       completion:@escaping ServiceResponse) {
//            DispatchQueue.global(qos: .background).async {
//                // Run on background
//                let request = Service.UpdateUser(userId: UserId, firstName: FirstName, lastName: LastName, gender: Gender, avatar: Avatar, allergy: Allergy, medicalHistory: MedicalHistory, symptom: Symptom) as URLRequestConvertible
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
    
    //MARK: -Get user info
    /*
         * Get user info
         * @param: UserId
         * @return list info of user in callback
     */
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


