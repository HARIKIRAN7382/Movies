//
//  NetworkClient.swift
//  Movies
//
//  Created by iOS Developer on 23/03/21.
//

import Foundation

public enum HTTPMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

public enum NetworkResponse:String{
    case success
    case authenticationError = "You are not authenticated user."
    case badRequest = "Bad request"
    case failure = "Network Request filed"
    case noData = "Response returned with no data to decode."
}

class NetworkClient{
    static let baseURL = "https://api.themoviedb.org/3/movie/"
    private static let apiKey = "46825cd00a85092a5b34a895fe161013"
    
    
    
    func requestForServer(endPoint:String, htttpQueryParms:[String:String]? = nil, httpHeaderParms:[String:String]? = nil, httpBody:Data? = nil, requestType:HTTPMethod, succesBlock success:@escaping((Data)->Void), failureBlock failure:@escaping((Error)->Void),failureReason reason:@escaping((NetworkResponse)->Void)){
        
        var url =  URL(string: NetworkClient.baseURL + endPoint)!
        
        if let quearyParms = htttpQueryParms{
            quearyParms.forEach { (parameter) in
                url.appendQueryItem(name: parameter.key, value: parameter.value)
            }
        }
        
        var request = URLRequest(url:url)
        
        request.httpMethod = requestType.rawValue
        
        if let headerParms = httpHeaderParms {
            headerParms.forEach { (parameter) in
                request.setValue(parameter.value, forHTTPHeaderField: parameter.key)
            }
        }
        
        if let body = httpBody {
            request.httpBody = body
        }
        
        let sessionRequest = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                failure(error)
                return
            }
            
            if let response:HTTPURLResponse = response as? HTTPURLResponse{
                switch self.handleNetworkResponse(response) {
                case .success:
                    if let data  = data {
                        success(data)
                    }else{
                        reason(.noData)
                    }
                case .authenticationError:
                    reason(.authenticationError)
                case .badRequest:
                    reason(.badRequest)
                case .failure:
                    reason(.failure)
                case .noData:
                    reason(.noData)
                }
            }
        }
        sessionRequest.resume()
        
    }
    
    private func handleNetworkResponse(_ response:HTTPURLResponse) -> NetworkResponse{
        switch response.statusCode {
        case 200...299:
            return .success
        case 401...500:
            return .authenticationError
        case  500...599:
            return .badRequest
        default:
            return .failure
        }
    }
    
}
