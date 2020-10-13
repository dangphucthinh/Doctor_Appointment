//
//  BaseClient.swift
//  Doctor_Appointment
//
//  Created by Oscar on 10/12/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire

class BaseClient: NSObject {
    
    var accessToken: String?
    
    //singleton
    static let shared = BaseClient()
    
    //block
    typealias ServiceResponse = (Bool?, NSError?, AnyObject) -> Void
    
    //create base url
    enum APIRouter : URLRequestConvertible {
       
        case login(username: String, password: String, grant_type: String)
        case changePassword(pass: String, newPass: String, confirmNewPass: String)
            
            // =========== End define api ===========
            
            // MARK: - HTTPMethod
            private var method: HTTPMethod {
                switch self {
                case .login, .changePassword:
                    return .post
                }
            }
            
            // MARK: - Path
            private var path: String {
                switch self {
                case .login:
                    return API.kLoginUrl
                case .changePassword:
                    return "v1/user/change_password"
                }
            }
            
            // MARK: - Headers
            private var headers: HTTPHeaders {
                var headers = ["Accept": "application/json"]
                switch self {
                case .login:
                    break
                case .changePassword:
                    headers["Authorization"] = getAuthorizationHeader()
                    break
                }
                
                return headers;
            }

            // MARK: - Parameters
            private var parameters: Parameters? {
                switch self {
                case .login(let username, let password, let grant_type):
                    return [
                        "username": username,
                        "password": password,
                        "grant_type" : grant_type
                    ]
                case .changePassword(let pass, let newPass, let confirmNewPass):
                    return[
                        "password": pass,
                        "new_password": newPass,
                        "new_password_confirmation": confirmNewPass
                    ]
                }
            }

            // MARK: - URL request
            func asURLRequest() throws -> URLRequest {
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
                
                return urlRequest
            }
            
            private func getAuthorizationHeader() -> String? {
                return "Authorization token"
            }
    }
}
