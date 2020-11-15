//
//  BaseClient_Appointment.swift
//  Doctor_Appointment
//
//  Created by Oscar on 11/6/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import ObjectMapper

extension BaseClient{
    //MARK: -get list appointment
    func GetListAppointment(userId: String,
                            statusId: Int,
                            completion: @escaping ServiceResponse){
        DispatchQueue.global(qos: .background).async {
            //Run on background
            let request = Service.getListAppointment(userId: userId,
                                                     statusId: statusId,
                                                     token: self.accessToken!)
            
            Alamofire.request(request)
                .responseObject{ (response: DataResponse<ResponseListAppointment>) in
                    switch response.result{
                    case let .success(data):
                        completion(true,nil,data)
                        break
                        
                    case let .failure(error):
                        completion(false, error as NSError?, nil)
                        break
                    }
                }
        }
    }
    
    
    //MARK: -Update appointment
    func UpdateAppointment(id: Int,
                           issue: String,
                           detail: String,
                           statusId: Int,
                           completion: @escaping ServiceResponse){
        DispatchQueue.global(qos: .background).async {
            //run on background
            let request = Service.updateAppointment(id: id,
                                                    issue: issue,
                                                    detail: detail,
                                                    statusId: statusId,
                                                    token: self.accessToken!)
            
            Alamofire.request(request)
                .responseObject{ (response: DataResponse<ResponseListAppointment>) in
                    switch response.result{
                    case let .success(data):
                        completion(true,nil,data)
                        break
                        
                    case let .failure(error):
                        completion(false, error as NSError?, nil)
                        break
                    }
                }
        }
    }
}
