//
//  BaseClient_User.swift
//  youMed
//
//  Created by thinhdang on 11/1/20.
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
                        
                        let avatar_user = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.User)) as? NSDictionary
                        self.avatar = avatar_user?.object(forKey: "avatar") as? String
                        
                        let email_user = ((rawValue as!  NSDictionary).object(forKey: ResponseKey.User)) as? NSDictionary
                        self.email = email_user?.object(forKey: "email") as? String
                        
                        
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
    
    //MARK: -Change Password
    func changePassword(oldPassword: String,
                        newPassword: String,
                        confirmPassword: String,
                        completion: @escaping ServiceResponse){
        DispatchQueue.global(qos: .background).async {
            // Run on background
            let request = Service.changePassword(oldPassword: oldPassword,
                                                 newPassword: newPassword,
                                                 confirmPassword: confirmPassword,
                                                 token: self.accessToken!)as URLRequestConvertible
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
    
    //MARK: -Reset password
    func resetPassword(email: String,
                       completion: @escaping ServiceResponse){
        DispatchQueue.global(qos: .background).async {
            // Run on background
            let request = Service.forgotPassword(email: email) as URLRequestConvertible
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
    
    //MARK: -Update profile
    func updateProfile(userId: String,
                       firstName:String,
                       lastName:String,
                       imageData:Data?,
                       symptom: String,
                       allergy: String,
                       medicalHistory: String,
                       completion: @escaping ServiceResponse) {
        
        let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                   "Accept": "application/json",
                   "Content-type": "multipart/form-data",
                    "Authorization": "Bearer \(self.accessToken!)"
            ]
            var parameters : [String:Any] = [:]
            
            parameters["UserId"] = userId
            parameters["FirstName"] = firstName
            parameters["LastName"] = lastName
            parameters["Symptom"] = symptom
            parameters["MedicalHistory"] = medicalHistory
            parameters["Allergy"] = allergy

        let url = API.kUpdate
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                }

                if let data = imageData {
                    multipartFormData.append(data, withName: "Avatar", fileName: "image.png", mimeType: "image/png")
                }

            }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
                switch result{
                    case .success(let upload, _, _):
                        upload.responseObject { (response : DataResponse<ResponseUser>) in
                            print("Succesfully uploaded  = \(response)")
                            completion(true,nil, ResponseUser.init(value: result))
                            if let err = response.error{
                            
                                print(err)
                                return
                            }

                        }
                    case .failure(let error):
                        print("Error in upload: \(error.localizedDescription)")

                    }
            }
        }

    

    
    //MARK: -Get user info
    /*
         * Get user info
         * @param: UserId
         * @return list info of user in callback
     */
    func GetUserInfo(UserId: String,
                     completion:@escaping ServiceResponse) {
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

