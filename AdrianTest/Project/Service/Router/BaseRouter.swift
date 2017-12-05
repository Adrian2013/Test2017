//
//  BaseRouter.swift
//  TestAdrian
//
//  Created by Dhanushka Adrian on 12/6/17.
//  Copyright © 2017 Dhanushka Adrian. All rights reserved.
//

import Foundation
import Alamofire

enum BaseURL: String {
    case dev = "https://api.tenor.com/v1"
}

public typealias JSONDictionary = [String: AnyObject]
typealias APIParams = [String : AnyObject]?

protocol APIConfiguration {
    
    var method: Alamofire.HTTPMethod { get }
    var encoding: Alamofire.ParameterEncoding? { get }
    var path: String { get }
    var parameters: APIParams { get }
    var baseUrl: String { get }
    
}


class BaseRouter: URLRequestConvertible, APIConfiguration {
    public func asURLRequest() throws -> URLRequest {
        
        let URL = NSURL(string: baseUrl)!
        let url = NSURL(string: path, relativeTo:URL as URL)!
        print("url Base: ",baseUrl)
        print("url End: ",path)
        var urlRequest = URLRequest(url: url as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest = try encoding!.encode(urlRequest, with: parameters)
        return urlRequest
    }
    
    init() {}
    
    var method: HTTPMethod {
        fatalError("[\(String(describing: Mirror(reflecting:self).displayStyle)) - \(#function))] Must be overridden in subclass")
    }
    
    var encoding: Alamofire.ParameterEncoding? {
        return JSONEncoding.default
    }
    
    var path: String {
        fatalError("[\(String(describing: Mirror(reflecting:self).displayStyle)) - \(#function))] Must be overridden in subclass")
    }
    
    var parameters: APIParams {
        fatalError("[\(String(describing: Mirror(reflecting:self).displayStyle)) - \(#function))] Must be overridden in subclass")
    }
    
    var baseUrl: String {
        return BaseURL.dev.rawValue
    }
    
}

