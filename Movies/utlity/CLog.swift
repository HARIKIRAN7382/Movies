//
//  CLog.swift
//  Movies
//
//  Created by iOS Developer on 25/03/21.
//
import Foundation

class CLog {
    
    private static var isDevlopment = true
    static var requestData = "REQUEST_DATA"
    static var responseData = "RESPONSE_DATA"
    
    static func infoWith(TAG: String, msg: String){
        if isDevlopment{
            print(TAG, " : " + msg)
        }
    }
    
    static func infoWith(TAG: String, msg: Any){
        if isDevlopment{
            print(TAG)
            print(msg)
        }
    }
    
    static func infoWith(TAG:String,responseType:String,data:Data){
        if isDevlopment{
            print(TAG)
            print(responseType)
            let jsonStirng = String(data: data, encoding: String.Encoding.utf8)
            debugPrint(jsonStirng?.data(using: .utf8)?.prettyPrintedJSONString ?? "")
        }
    }
}
