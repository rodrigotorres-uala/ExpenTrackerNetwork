//
//  ExpensiveTrackerNetwork.swift
//  ExpenTrackerNetwork
//
//  Created by Rodrigo Torres on 17/02/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingError(error: Error)
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public struct APIResponse<T: Decodable>: Decodable {
    let data: T
}

public struct NetworkClient {
    
    static func fetchData<T: Decodable>(from url: URL, method: HTTPMethod, headers: [String: String] = [:], body: Data? = nil, expectedResponseType: T.Type) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.httpError(statusCode: httpResponse.statusCode)
        }

        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            throw NetworkError.decodingError(error: error)
        }
    }
}
