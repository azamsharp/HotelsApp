//
//  HotelListViewModel.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import Foundation

class HotelListViewModel: ObservableObject {
    
    @Published var hotels: [HotelViewModel] = []
    
    func populateHotels(filter: FilterViewState? = nil) async {
        
        do {
            
            guard let url = Constants.Urls.allHotels(filter) else {
                throw NetworkError.badUrl
            }
            
            let hotels = try await Webservice().getAllHotels(url: url)
            DispatchQueue.main.async {
                self.hotels = hotels.map(HotelViewModel.init)
            }
            
        } catch {
            print(error)
        }
    }
}

struct HotelViewModel: Identifiable {
    
    private let hotel: Hotel
    
    init(hotel: Hotel) {
        self.hotel = hotel
    }
    
    var id: Int {
        hotel.id
    }
    
    var title: String {
        hotel.title
    }
    
    var photoUrl: URL {
        hotel.photoUrl
    }
    
    var rating: Double? {
        hotel.rating
    }
    
    var price: Double {
        hotel.price
    }
}
