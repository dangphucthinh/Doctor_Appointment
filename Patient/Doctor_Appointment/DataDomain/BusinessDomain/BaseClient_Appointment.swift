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
    //MARK: -Make an appointment
    func MakeAnAppointment(doctorId: String,
                           patientId: String,
                           meetingTime: Date,
                           startTime: String,
                           issue: String,
                           detail: String,
                           completion:@escaping ServiceResponse) {
            DispatchQueue.global(qos: .background).async {
                // Run on background
                let request = Service.makeAnAppointment(doctorId: doctorId,
                                                        patientId: patientId,
                                                        meetingTime: meetingTime,
                                                        startTime: startTime,
                                                        issue: issue,
                                                        detail: detail,
                                                        token: self.accessToken!)
                
                Alamofire.request(request)
                        .responseObject { (response: DataResponse<ResponseAppointment>) in
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
    
    //MARK: -get list appointment
    func GetListAppointment(userId: String,
                            completion: @escaping ServiceResponse){
        DispatchQueue.global(qos: .background).async {
            //Run on background
            let request = Service.getListAppointment(userId: userId, token: self.accessToken!)
            
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
