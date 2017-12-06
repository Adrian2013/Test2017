//
//  MediaManager.swift
//  AdrianTest
//
//  Created by Dhanushka Adrian on 12/6/17.
//  Copyright © 2017 Dhanushka Adrian. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class MediaManager {
    
    static let shared = MediaManager()
    private init() {}

    //MARK: Get Gif List
    func getGifListWebservice(completion: @escaping (_ terms: MediaModel) -> () ,
                                  failure: @escaping (_ error: Error) -> ())  {
        
        let router = MediaRouter(endpoint: .getMediaList())
        APIManager.sharedInstance.manager.request(router).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                print("Print Gif List" ,response.result.value!)
                let json = JSON(value)
                var sampleResponse:MediaModel!
                sampleResponse = MediaModel(json: json)
                completion(sampleResponse)
                
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    
    
}
