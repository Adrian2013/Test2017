//
//  APIManager.swift
//  TestAdrian
//
//  Created by Dhanushka Adrian on 12/6/17.
//  Copyright © 2017 Dhanushka Adrian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public class APIManager: NSObject {
    
    
    public class var sharedInstance: APIManager {
        return Singleton.instance
    }
    
    override init() {
        
    }
    
    var manager = Alamofire.SessionManager ()
    
    
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}


