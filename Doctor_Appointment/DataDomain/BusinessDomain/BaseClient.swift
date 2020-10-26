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
    
    var accessToken : String?
    var userId : String?
    var fullName : String?
    var abc : String?
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
        
        case GetPatientInfo(UserId: String,
                            token: String)
        
        case UpdateUser(userId: String,
                        firstName: String,
                        lastName: String,
                        gender: Bool,
                        avatar: UIImage?,
                        allergy: String,
                        medicalHistory: String,
                        symptom: String)
        
        static let baseHTTP = API.kBaseUrl
        
  
        //MARK: -Method
        private var method: HTTPMethod{
            switch self {
            case .login, .changePassword, .register, .GetPatientInfo, .UpdateUser:
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
            case .GetPatientInfo:
                return API.kPatientInfo
            case .UpdateUser:
                return API.kPatientUpdate
            }
        }
            
        //MARK: -Header
        private var headers: HTTPHeaders {
            //var headers = ["Accept": "application/json"]
            var headers = ["Accept" : "multipart/form-data"]
            switch self {
            case .register:
                break
            case .login:
                break
            case .changePassword:
                headers["Authorization"] = getAuthorizationHeader()
                break
            case .GetPatientInfo:
                break
            case .UpdateUser:
                break
            }
            return headers;
        }
        
        private func getAuthorizationHeader() -> String?{
            return "Bearer token"
        }
        
        // MARK: - Parameters
        private var parameters: Parameters? {
            switch self {
            case .login(let username,
                        let password):
                return [
                    "Username": username,
                    "Password": password
                ]
            case .changePassword(let pass,
                                 let newPass,
                                 let confirmNewPass,_):
                return[
                    "Password": pass,
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
                "Username" : username,
                "Email" : email,
                "FirstName" : firstName,
                "LastName" : lastName,
                "DateOfBirth" : dateOfBirth,
                "PhoneNumber" : phoneNumber,
                "Password" : password,
                "ConfirmPassword" : confirmPassword
            ]
                
            case .GetPatientInfo(let UserId, _):
                return[
                    "UserId" : UserId
                ]
                
            case .UpdateUser(let userId,
                             let firstName,
                             let lastName,
                             let gender,
                             let avatar,
                             let allergy,
                             let medicalHistory,
                             let symptom):
                return[
                    "UserId" : userId,
                    "FirstName" : firstName,
                    "LastName" : lastName,
                    "Gender" : gender,
                    "Avatar" : avatar!,
                    "Allergy" : allergy,
                    "MedicalHistory" : medicalHistory,
                    "Symptom" : symptom
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
            case .login, .register, .changePassword, .UpdateUser:
                return urlRequest
                            
            case .GetPatientInfo(UserId: _, token: let accessToken):
                urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: Header.Authorization)
                return urlRequest
            }
            }
        }
        
    }

