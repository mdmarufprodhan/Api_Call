//
//  NetworkingClient.swift
//  ApiCall
//
//  Created by Md Maruf Prodhan on 1/15/20.
//  Copyright © 2020 Md Maruf Prodhan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient {
    
    typealias webServiceResponse = ([[String: Any]]? , Error?) -> Void
    
    func execute (_ url : URL, completion: @escaping webServiceResponse){
        
        Alamofire.request(url).validate().responseJSON { response in
            
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.result.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
    }

}
