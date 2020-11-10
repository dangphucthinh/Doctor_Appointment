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
                                          token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1laWQiOiIzYmFlMWFmYy1mZjI5LTQyMWYtYjgwZS01M2E3NjYzNWRhMGEiLCJ1bmlxdWVfbmFtZSI6InRoaW5oZGFuZyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vYWNjZXNzY29udHJvbHNlcnZpY2UvMjAxMC8wNy9jbGFpbXMvaWRlbnRpdHlwcm92aWRlciI6IkFTUC5ORVQgSWRlbnRpdHkiLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjJmMTA0YWIyLTBlOGYtNDYyNC1iMjYxLTA5ZDIwMmM4YTAyYiIsInJvbGUiOiJQYXRpZW50IiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzNTUvIiwiYXVkIjoiNDE0ZTE5MjdhMzg4NGY2OGFiYzc5ZjcyODM4MzdmZDEiLCJleHAiOjE2MDU1ODY5MjEsIm5iZiI6MTYwNDk4MjEyMX0.sTjRSJ2AvHG-ujboBch1tHbQUkYwiiopG_6aHB2dlOg")
            
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
}
