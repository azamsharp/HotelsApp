//
//  HotelListView.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import SwiftUI

struct HotelListView: View {
    
    let hotels: [HotelViewModel]
    
    var body: some View {
        List(hotels) { hotel in
            HotelCellView(hotel: hotel)
        }.listStyle(.plain)
    }
}

struct HotelListView_Previews: PreviewProvider {
    static var previews: some View {
        HotelListView(hotels: [])
    }
}
