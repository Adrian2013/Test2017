//
//  MediaRouter.swift
//  TestAdrian
//
//  Created by Dhanushka Adrian on 12/6/17.
//  Copyright © 2017 Dhanushka Adrian. All rights reserved.
//

import Foundation
import Alamofire


enum MediaEndpoint {
    case getMediaList()
  
}
class MediaRouter: BaseRouter {
    
    var endpoint: MediaEndpoint
    
    init(endpoint: MediaEndpoint) {
        self.endpoint = endpoint
        super.init()
    }
    
    override var method: Alamofire.HTTPMethod {
        switch endpoint {
        case .getMediaList: return .get
        
        }
    }
    
    override var path: String {
        switch endpoint {
        case .getMediaList(): return "/tags?key=LIVDSRZULELA"
      
        }
    }
    
    override var parameters: APIParams {
        switch endpoint {
        case .getMediaList() :
            return nil
        }
    }
    
    
}

