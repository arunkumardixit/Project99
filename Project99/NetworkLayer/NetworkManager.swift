//
//  ConnectionManager.swift
//  My Test
//
//  Created by Dixit, Arun on 24/07/18.
//  Copyright © 2018 Dixit, Arun. All rights reserved.
//

import UIKit
import Alamofire


private class API {
    static let baseURL: String = "https://reqres.in/api/"
    static let LoginAPI: String = "login"
}

class NetworkManager: NSObject {
    typealias CompletionBlock = ([String: Any]?) -> Void

    static let sharedManager = NetworkManager(baseURL: URL(string: API.baseURL)!)
    
    let baseURL: URL
 
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public func loginWithCompletionBlock (user: String, pwd: String, completionBlock: @escaping CompletionBlock) {
        
        guard let url = URL(string:  API.baseURL + API.LoginAPI) else {
            
            return
        }
        
        Alamofire.request(url,
                          method: .post,
                          parameters: [
                            "email": user,
                            "password": pwd])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error ")
                
                    return
                }
                guard let value = response.result.value as? [String: Any] else {
                        print("Malformed data received from fetchAllRooms service")
                        completionBlock(nil)
                        return
                }
                
                completionBlock(value)
        }
    }
    
    
}
