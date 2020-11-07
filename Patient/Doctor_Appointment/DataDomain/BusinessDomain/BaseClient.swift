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
        
        case getListDoctor
        
        case makeAnAppointment(doctorId: String,
                               patientId: String,
                               meetingTime: Date,
                               startTime: String,
                               issue: String,
                               detail: String,
                               token: String)
        
        case getListAppointment(userId: String,
                                token: String)
        

        
        static let baseHTTP = API.kBaseUrl
        
  
        //MARK: -Method
        private var method: HTTPMethod{
            switch self {
            case .login, .changePassword, .register, .GetPatientInfo :
                return .post
            case .makeAnAppointment, .getListAppointment:
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
            case .makeAnAppointment:
                return API.kMakeAnAppointment
            case .getListAppointment:
                return API.kGetListAppoinment
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
            case .makeAnAppointment:
                break
            case .getListAppointment:
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
           
            case .getListDoctor:
                return [:]
                
            case .makeAnAppointment(let doctorId,
                                    let patientId,
                                    let meetingTime,
                                    let startTime,
                                    let issue,
                                    let detail,
                                    _):
            return[
                "DoctorId" : doctorId,
                "PatientId" : patientId,
                "Issue" : issue,
                "MeetingTime" : meetingTime,
                "StartTime" : startTime,
                "Detail" : detail
            ]
                
            case .getListAppointment(let userId,
                                     _):
                return [
                    "UserId" : userId
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
            case .login, .register, .changePassword, .getListDoctor:
                return urlRequest
                            
            case .GetPatientInfo(UserId: _, token: let accessToken),
                 .makeAnAppointment(doctorId: _, patientId: _, meetingTime: _, startTime: _, issue: _, detail: _, token: let accessToken),
                 .getListAppointment(userId: _, token: let accessToken):
                urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: Header.Authorization)
                return urlRequest
            }
            }
        }
        
    }

