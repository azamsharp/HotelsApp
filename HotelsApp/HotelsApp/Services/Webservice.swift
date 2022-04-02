//
//  Webservice.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
}

class Webservice {
    
    func getAllHotels(url: URL) async throws -> [Hotel] {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidRequest
        }
        
        let hotels = try? JSONDecoder().decode([Hotel].self, from: data)
        return hotels ?? []
    }
    
}
