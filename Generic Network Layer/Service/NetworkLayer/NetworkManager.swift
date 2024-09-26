//
//  NetworkManager.swift
//  Generic Network Layer
//
//  Created by Ahmet Tunahan Bekdaş on 25.09.2024.
//

import Foundation

// https://jsonplaceholder.typicode.com/users

protocol NetworkManagerProtocol {
    func request<T:Codable>(_ endPoint: EndPoint, completion: @escaping(Result<T, NetworkError>) -> Void)
    
}

final class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    let session = URLSession.shared
    private init(){}
    
    func request<T: Codable>(_ endPoint: EndPoint, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let task = session.dataTask(with: endPoint.requst()) { data, response, error in
            guard  error == nil else {
                completion(.failure(.unableToCompleteError))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            switch response.statusCode {
            case 200...299:
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.decodingError))
                }
            case 401:
                completion(.failure(.authError))
            default:
                completion(.failure(.unknownError))
            }
        }
        task.resume()
    }
}
