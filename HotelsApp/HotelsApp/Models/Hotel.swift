//
//  Hotel.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import Foundation

struct Hotel: Decodable {
    let id: Int
    let title: String
    let photoUrl: URL
    let rating: Double?
    let price: Double
}
