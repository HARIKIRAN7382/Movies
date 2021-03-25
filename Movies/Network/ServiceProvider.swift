//
//  ServiceProvider.swift
//  Movies
//
//  Created by iOS Developer on 23/03/21.
//

import Foundation

class ServiceProvider{
    
    let client = NetworkClient()
    
    func getTopRatedMoviesList(successBlock success:@escaping(GetTopRatedMovieData)->Void,failureBlock failure:@escaping(String)->Void){
        client.requestForServer(endPoint: "top_rated",htttpQueryParms: ["api_key":"46825cd00a85092a5b34a895fe161013","language":"en-US","page":"1"], httpHeaderParms: nil, httpBody: nil, requestType: .get) { (jsonData) in
            do {
                CLog.infoWith(TAG: "TOP RATED MOVIES", responseType: "RESPONSE", data: jsonData)
                let topRatedMovies = try JSONDecoder().decode(GetTopRatedMovieData.self, from: jsonData)
                success(topRatedMovies)
            }catch let error {
                failure(error.localizedDescription)
            }
        } failureBlock: { (error) in
            failure(error.localizedDescription)
        } failureReason: { (reason) in
            failure(reason.rawValue)
        }
        
    }
    
    func getUpcomingMoviesList(successBlock success: @escaping(GetUpcomingMovieData)->Void,failureBlock failure:@escaping(String)->Void){
        client.requestForServer(endPoint: "upcoming",htttpQueryParms: ["api_key":"46825cd00a85092a5b34a895fe161013","language":"en-US","page":"1"], httpHeaderParms: nil, httpBody: nil, requestType: .get) { (jsonData) in
            do{
                CLog.infoWith(TAG: "UPCOMING MOVIES", responseType: "RESPONSE", data: jsonData)
                let upcomingMovies = try JSONDecoder().decode(GetUpcomingMovieData.self, from: jsonData)
                success(upcomingMovies)
            }catch let error {
                failure(error.localizedDescription)
            }
        } failureBlock: { (error) in
            failure(error.localizedDescription)
        } failureReason: { (reason) in
            failure(reason.rawValue)
        }
    }
    
}
