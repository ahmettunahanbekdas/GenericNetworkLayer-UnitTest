//
//  EndPoint.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import Foundation

// https://jsonplaceholder.typicode.com/users

enum NetworkError: String, Error {
    case unableToCompleteError
    case invalidResponse
    case invalidData 
    case authError 
    case unknownError
    case decodingError
}

protocol EndPointProtocol {
    var BaseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String:String]? { get }
    func requst() -> URLRequest
}

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum EndPoint {
    case getUser
//    case getUserDetail(_ id: Int)
}

extension EndPoint: EndPointProtocol {
    var BaseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/users"
//        case .getUserDetail(let id):
//            return "/user/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
//        case .getUserDetail(let id):
//            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func requst() -> URLRequest {
        guard var components = URLComponents(string: BaseURL) else { fatalError("URL Error") }
        components.path = path
        guard let url = components.url else { fatalError("BaseUrl Error") }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let header = header {
            for(key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}
