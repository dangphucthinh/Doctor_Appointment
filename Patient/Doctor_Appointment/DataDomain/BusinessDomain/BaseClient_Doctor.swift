//
//  BaseClient_Doctor.swift
//  Doctor_Appointment
//
//  Created by Oscar on 11/6/20.
//  Copyright © 2020 Thinh (Oscar) P. DANG. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RealmSwift

extension BaseClient{
    //MARK: -Get List All Specialites
    func GetListDoctor(completion:@escaping ServiceResponse) {
            DispatchQueue.global(qos: .background).async {
                // Run on background
                let request = Service.getListDoctor as URLRequestConvertible
                Alamofire.request(request)
                        .responseObject { (response: DataResponse<ResponseDoctor>) in
                        switch response.result {
                        case let .success(data):
                            //var a = data.data
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
