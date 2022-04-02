//
//  FilterViewModel.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import Foundation


class FilterViewModel: ObservableObject {
    
    @Published var price: Double = 100.0
    @Published var rating: Int?
    @Published var popularFilters: [PopularFilters] = []
    
}

extension FilterViewModel {
    
    func containsFilter(_ filter: String) -> Bool {
        return popularFilters.contains { $0.rawValue == filter }
    }
    
}
