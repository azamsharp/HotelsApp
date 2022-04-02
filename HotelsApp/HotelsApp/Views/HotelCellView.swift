//
//  HotelCellView.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import SwiftUI

struct HotelCellView: View {
    
    let hotel: HotelViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            
            AsyncImage(url: hotel.photoUrl) { image in
                image.resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            } placeholder: {
                ProgressView()
            }

            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(hotel.title)
                        .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                    hotel.rating.map { rating in
                        Text(String(format: "%.1f/5", rating))
                            .fontWeight(.bold)
                    }
                }
                Spacer()
                Text(hotel.price.formatAsCurrency() ?? "")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
            }
            
            
                
        }
    }
}
