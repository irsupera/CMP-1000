//
//  API_Helper.swift
//  API
//
//  Created by IR Supera on 2022-05-18.
//  A00237146

import Foundation

class API_Helper{
    
    private static var baseURL = URL(string: "")
    
    private static var session: URLSession = {
        var config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func setURL(apiURL: String){
        baseURL = URL(string: apiURL)
    }
    
    static func fetchData(callback: @escaping (Any) -> Void){
        let request = URLRequest(url: baseURL!)
        let task = session.dataTask(with: request){
            data, response, error in
            if let data = data {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    callback(jsonData)
                } catch let error {
                    print("Error \(error)")
                }
            } else if let error = error {
                print(error)
            } else {
                print("Unknown Error")
            }
        }
        task.resume()
    }
    
}
