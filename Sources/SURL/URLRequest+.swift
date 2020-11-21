//
//  URLRequest+.swift
//  
//
//  Created by Zach Eriksen on 11/20/20.
//

import Foundation

public extension URLRequest {
    
    // MARK: HTTPRequestMethod
    
    enum HTTPRequestMethod: String {
        case GET
        case HEAD
        case POST
        case PUT
        case DELETE
        case CONNECT
        case OPTIONS
        case TRACE
        case PATCH
    }
    
    
    
    var dataTask: URLSessionDataTask {
        URLSession.shared.dataTask(with: self)
    }
    
    @available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
    var dataTaskPublisher: URLSession.DataTaskPublisher {
        URLSession.shared.dataTaskPublisher(for: self)
    }
    
    
    func dataTask(withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: self, completionHandler: handler)
    }
}
