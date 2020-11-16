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
    var avatar : String?
    
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
        
        case getDoctorInfo(userId: String,
                           token: String)
        
        case getListDoctor(token: String)
        
        //appointment
        
        case getListAppointment(userId: String,
                                statusId: Int,
                                token: String)
        
        case updateAppointment(id: Int,
                               issue: String,
                               detail: String,
                               statusId: Int,
                               token: String)

        
        static let baseHTTP = API.kBaseUrl
        
  
        //MARK: -Method
        private var method: HTTPMethod{
            switch self {
            case .login, .changePassword, .register, .GetPatientInfo, .getDoctorInfo :
                return .post
            case .getListAppointment, .updateAppointment:
                return .post
            case .getListDoctor:
                return .get
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
            case .getListDoctor:
                return API.kGetListAllDoctor
            case .getDoctorInfo:
                return API.kGetDoctorInfo
            case .getListAppointment:
                return API.kGetListAppoinment
            case .updateAppointment:
                return API.kUpdateAppointment
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
            case .getListDoctor:
                break
            case .getDoctorInfo:
                break
            case .getListAppointment:
                break
            case .updateAppointment:
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
                
            case .getDoctorInfo(let userId,
                                _):
                return[
                    "UserId" : userId
                ]
           
            case .getListDoctor(_):
                return [:]
                
            case .getListAppointment(let userId,
                                     let statusId,
                                     _):
                return [
                    "UserId" : userId,
                    "StatusId" : statusId
                ]
                
            case .updateAppointment(let id,
                                    let issue,
                                    let detail,
                                    let statusId,
                                    _):
                return[
                    "Id" : id,
                    "Issue" : issue,
                    "Detail" : detail,
                    "StatusId" : statusId
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
            case .login, .register, .changePassword, .getDoctorInfo:
                return urlRequest
                            
            case .GetPatientInfo(UserId: _, token: let accessToken),
                 .getListAppointment(userId: _, statusId: _, token: let accessToken),
                 .updateAppointment(id: _, issue: _, detail: _, statusId: _, token: let accessToken),
                 .getListDoctor(token: let accessToken):
                urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: Header.Authorization)
                return urlRequest
            }
            }
        }
        
    }



