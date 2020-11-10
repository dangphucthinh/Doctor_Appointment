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
