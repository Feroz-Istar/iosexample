//
//  HttpCall.swift
//  IOSExample
//
//  Created by Istar Feroz on 28/09/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//

import Foundation
class HttpCall {
    var url: String
    
    init(url:String) {
        self.url = url
    }
    
    
    func getResponse() -> String {
        let urlString = URL(string: self.url)
        
        let request = URLRequest(url:urlString!)
        var success = ""
        let semaphore = DispatchSemaphore(value: 0)

       let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
        if let error = error {
            print("Error while trying to re-authenticate the user: \(error)")
        } else if let response = response as? HTTPURLResponse,
            300..<600 ~= response.statusCode {
            print("Error while trying to re-authenticate the user, statusCode: \(response.statusCode)")
        } else {
            success = String(data: data!, encoding: .utf8)!
        }
        
        semaphore.signal()
       })
        task.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return success
    }
    
        
        
   
    
    
    
}
