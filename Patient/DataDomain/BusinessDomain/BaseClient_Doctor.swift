//
//  BaseClient_Doctor.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//

import Foundation
import Alamofire

extension BaseClient{
    //MARK: -Get List All Doctor
    func GetListDoctor(completion:@escaping ServiceResponse) {
            DispatchQueue.global(qos: .background).async {
                // Run on background
                let request = Service.getListDoctor(token: self.accessToken!) as URLRequestConvertible
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
    
    //MARK: -Search Doctor
    func SearchDoctor(searchPhrase: String,
                      completion: @escaping ServiceResponse){
        DispatchQueue.global(qos: .background).async {
            //Run on background
            let request = Service.search(searchPhrase: searchPhrase) as URLRequestConvertible
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
    
    func getDoctorByHospital(Id: Int,
                             completion:@escaping ServiceResponse) {
         DispatchQueue.global(qos: .background).async {
             // Run on background
             let request = Service.getDoctorByHospital(Id: Id, token: self.accessToken!)as URLRequestConvertible
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
    
    func getDoctorBySpecialty(HsId: Int,
                             completion:@escaping ServiceResponse) {
         DispatchQueue.global(qos: .background).async {
             // Run on background
             let request = Service.getDoctorBySpecialty(HsId: HsId, token: self.accessToken!)as URLRequestConvertible
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
