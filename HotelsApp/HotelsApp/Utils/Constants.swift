//
//  Constants.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        //static let allHotels = URL(string: "http://localhost:8080/hotels")!
        
        static func allHotels(_ filter: FilterViewState?) -> URL? {
            
            var components = URLComponents()
            components.scheme = "http"
            components.percentEncodedHost = "localhost:8080"
            components.path = "/hotels"
            
            if let filter = filter {
                let queryItemPrice = URLQueryItem(name: "price", value: String(filter.price))
                let queryItemPopularFilters = filter.popularFilters.map {
                    URLQueryItem(name: "popularFilters", value: $0.rawValue)
                }
                
                let queryItemRating = URLQueryItem(name: "rating", value: String(filter.rating ?? 0))
                
                components.queryItems = [queryItemPrice, queryItemRating]
                queryItemPopularFilters.forEach {
                    components.queryItems?.append($0)
                }
            }
            
            return components.url
            
        }
        
    }
    
}
