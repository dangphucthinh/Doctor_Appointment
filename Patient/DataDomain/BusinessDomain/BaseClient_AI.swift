//
//  BaseClient_AI.swift
//  youMed
//
//  Created by Oscar on 11/10/20.
//

import Foundation
import Alamofire

extension BaseClient{
    func Chatbot(data: String,
                completion: @escaping ServiceResponse){
        DispatchQueue.global(qos: .background).async {
            //Run on background
            let request = Service.chatbot(data: data,
                                          token: self.accessToken!)
            
            Alamofire.request(request)
                .responseObject{ (response: DataResponse<ResponseChatbot>) in
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
        
        func Prediction(data: Array<Any>,
                        completion: @escaping ServiceResponse){
            DispatchQueue.global(qos: .background).async {
                //Run on background
                
                let request = Service.prediction(data: data,
                                                 token: self.accessToken!)
                
                Alamofire.request(request)
                    .responseObject{ (response: DataResponse<ResponsePrediction>) in
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
