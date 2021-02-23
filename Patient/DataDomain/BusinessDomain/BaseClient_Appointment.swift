//
//  BaseClient_Appointment.swift
//  youMed
//
//  Created by thinhdang on 11/8/20.
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
}

