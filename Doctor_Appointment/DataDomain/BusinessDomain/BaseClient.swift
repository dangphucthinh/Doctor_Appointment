//
//  BaseClient.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/14/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire

class BaseClient: NSObject{
    
    //var accessToken : String?
    
    //singleton
    static let shared = BaseClient()
    
    //block
    typealias ServiceResponse = (Bool?, NSError?, AnyObject?) -> Void
    
    enum Service: URLRequestConvertible {
        case login(username: String, password: String)
        case register(username: String,
                      email: String,
                      firstName: String,
                      lastName: String,
                      dateOfBirth: Date,
                      phoneNumber: String,
                      password: String,
                      confirmPassword: String)
        case changePassword(oldPassword: String,
                            newPassword: String,
                            confirmPassword:String,
                            token: String)
        
  
        //MARK: -Method
        private var method: HTTPMethod{
            switch self {
            case .login, .changePassword, .register:
                return .post
            }
        }
            
        //MARK: -Path
        private var path: String{
            switch self {
            case .login:
                return API.kLogin
            case .register:
                return API.kRegisterUrl
            case .changePassword:
                return API.kChangePassword
            }
        }
            
        //MARK: -Header
        private var headers: HTTPHeaders {
            var headers = ["Accept": "application/json"]
            switch self {
            case .register:
                break
            case .login:
                break
            case .changePassword:
                headers["Authorization"] = getAuthorizationHeader()
                break
            }
            return headers;
        }
        
        private func getAuthorizationHeader() -> String?{
            return "Authorization token"
        }
        
        // MARK: - Parameters
        private var parameters: Parameters? {
            switch self {
            case .login(let username,
                        let password):
                return [
                    "username": username,
                    "password": password
                ]
            case .changePassword(let pass,
                                 let newPass,
                                 let confirmNewPass,_):
                return[
                    "password": pass,
                    "new_password": newPass,
                    "new_password_confirmation": confirmNewPass
                ]
            case .register(let username,
                           let email,
                           let firstName,
                           let lastName,
                           let dateOfBirth,
                           let phoneNumber,
                           let password,
                           let confirmPassword
                          ):
            return[
                "username" : username,
                "email" : email,
                "firstname" : firstName,
                "lastname" : lastName,
                "dateofbirth" : dateOfBirth,
                "phonenumber" : phoneNumber,
                "password" : password,
                "confirmpassword" : confirmPassword
            ]
            }
        }
        
        //MARK: -Url request
        func asURLRequest() throws -> URLRequest {
            //create
            let url = try API.kBaseUrl.asURL()
            
            // setting path
            var urlRequest: URLRequest = URLRequest(url: url.appendingPathComponent(path))
            
            // setting method
            urlRequest.httpMethod = method.rawValue
            
            // setting header
            for (key, value) in headers {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
            
            if let parameters = parameters {
                do {
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                } catch {
                    print("Encoding fail")
                }
            }
            
            switch self {
            case .login, .register:
                return urlRequest
            case .changePassword(token: let accessToken):
                urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: Header.Authorization)
                return urlRequest
            }
        }
        
    }
}
