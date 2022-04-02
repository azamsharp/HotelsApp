//
//  FilterViewState.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import Foundation

struct FilterViewState: Codable {
    
    var price: Double = 100.0
    var rating: Int?
    var popularFilters: [PopularFilters] = []
}
