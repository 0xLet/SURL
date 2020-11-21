//
//  URL+.swift
//  
//
//  Created by Zach Eriksen on 11/20/20.
//

import Foundation

public extension URL {
    
    // MARK: URLSession DataTasks
    
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
    
    // MARK: URLRequest
    
    func urlRequest(
        forHTTPMethod httpMethod: URLRequest.HTTPRequestMethod? = .GET,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 60.0
    ) -> URLRequest {
        var request = URLRequest(url: self,
                                 cachePolicy: cachePolicy,
                                 timeoutInterval: timeoutInterval)
        
        request.httpMethod = httpMethod?.rawValue
        
        return request
    }
}

// MARK: URL HTTPRequestMethod DataTasks
public extension URL {
    
    func get(
        withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        urlRequest(forHTTPMethod: .GET).dataTask(withHandler: handler).resume()
    }
    
    func head(
        withHandler handler: @escaping (URLResponse?, Error?) -> Void
    ) {
        urlRequest(forHTTPMethod: .HEAD).dataTask { (data, response, error) in
            handler(response, error)
        }.resume()
    }
    
    func connect(
        withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        urlRequest(forHTTPMethod: .CONNECT).dataTask(withHandler: handler).resume()
    }
    
    func options(
        withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        urlRequest(forHTTPMethod: .OPTIONS).dataTask(withHandler: handler).resume()
    }
    
    func trace(
        withHandler handler: @escaping (URLResponse?, Error?) -> Void
    ) {
        urlRequest(forHTTPMethod: .TRACE).dataTask { (data, response, error) in
            handler(response, error)
        }.resume()
    }
    
    func post(
        data: Data?,
        withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        var request = urlRequest(forHTTPMethod: .POST)
        
        request.httpBody = data
        
        request.dataTask(withHandler: handler).resume()
    }
    
    func put(
        data: Data?,
        withHandler handler: @escaping (URLResponse?, Error?) -> Void
    ) {
        var request = urlRequest(forHTTPMethod: .PUT)
        
        request.httpBody = data
        
        request.dataTask { (data, response, error) in
            handler(response, error)
        }.resume()
    }
    
    func patch(
        data: Data?,
        withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        var request = urlRequest(forHTTPMethod: .PATCH)
        
        request.httpBody = data
        
        request.dataTask(withHandler: handler).resume()
    }
    
    func delete(
        data: Data?,
        withHandler handler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        var request = urlRequest(forHTTPMethod: .DELETE)
        
        request.httpBody = data
        
        request.dataTask(withHandler: handler).resume()
    }
    
}

// MARK: URL HTTPRequestMethod DataTaskPublishers
@available(macOS 10.15, iOS 13, watchOS 6, tvOS 13, *)
public extension URL {
    
    func get() -> URLSession.DataTaskPublisher {
        urlRequest(forHTTPMethod: .GET).dataTaskPublisher
    }
    
    func head() -> URLSession.DataTaskPublisher {
        urlRequest(forHTTPMethod: .HEAD).dataTaskPublisher
    }
    
    func connect() -> URLSession.DataTaskPublisher {
        urlRequest(forHTTPMethod: .CONNECT).dataTaskPublisher
    }
    
    func options() -> URLSession.DataTaskPublisher {
        urlRequest(forHTTPMethod: .OPTIONS).dataTaskPublisher
    }
    
    func trace() -> URLSession.DataTaskPublisher {
        urlRequest(forHTTPMethod: .TRACE).dataTaskPublisher
    }
    
    func post(data: Data?) -> URLSession.DataTaskPublisher {
        var request = urlRequest(forHTTPMethod: .POST)
        
        request.httpBody = data
        
        return request.dataTaskPublisher
    }
    
    func put(data: Data?) -> URLSession.DataTaskPublisher {
        var request = urlRequest(forHTTPMethod: .PUT)
        
        request.httpBody = data
        
        return request.dataTaskPublisher
    }
    
    func patch(data: Data?) -> URLSession.DataTaskPublisher {
        var request = urlRequest(forHTTPMethod: .PATCH)
        
        request.httpBody = data
        
        return request.dataTaskPublisher
    }
    
    func delete(data: Data?) -> URLSession.DataTaskPublisher {
        var request = urlRequest(forHTTPMethod: .DELETE)
        
        request.httpBody = data
        
        return request.dataTaskPublisher
    }
    
}
