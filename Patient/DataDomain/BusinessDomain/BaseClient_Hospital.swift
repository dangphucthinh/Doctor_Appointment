//
//  BaseClient_Hospital.swift
//  youMed
//
//  Created by thinhdang on 11/10/20.
//

import Foundation
import Alamofire

extension BaseClient{
    //MARK: -Get List All Doctor
    func GetListHospital(completion:@escaping ServiceResponse) {
            DispatchQueue.global(qos: .background).async {
                // Run on background
                let request = Service.getListHospital(token: self.accessToken!) as URLRequestConvertible
                Alamofire.request(request)
                        .responseObject { (response: DataResponse<ResponseListHospital>) in
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
