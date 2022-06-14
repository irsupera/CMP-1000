//
//  DogAPIHelper.swift
//  Assignment1
//
//  Created by IR Supera on 2022-06-13.
//  Iricher Supera (A00237146)

import Foundation

class DogAPIHelper{
    
    private static let baseURL = URL(string: "https://dog.ceo/api/breeds/list/all")!
    
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchJSONSerial(callback: @escaping ([String])->Void){
        let request = URLRequest(url: baseURL)
        let task = session.dataTask(with: request) {
            data, _, error in
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    
                    guard
                        let jsonDictionary = jsonObject as? [AnyHashable:Any],
                        let message = jsonDictionary["message"] as? [String:[Any]]
                    else { preconditionFailure("something went wrong with guard") }

                    var dogBreeds = [String]()
                    for msg in message {
                        dogBreeds.append(msg.key)
                    }
                    
                    callback(dogBreeds)
                } catch let e {
                    print("something went wrong with serialization: \(e)")
                }
            }
        }
        task.resume()
    }
    
}
