//
//  FilterView.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import SwiftUI

enum PopularFilters: String, CaseIterable, Codable {
    case breakfast = "Breakfast"
    case parking = "Parking"
    case wifi = "Wifi"
}

struct FilterView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm: FilterViewModel
    
    let onFilterApplied: (FilterViewState) -> Void
    
    init(vm: FilterViewModel, onFilterApplied: @escaping (FilterViewState) -> Void) {
        _vm = StateObject(wrappedValue: vm)
        self.onFilterApplied = onFilterApplied
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Filters")
                .font(.title)
                .fontWeight(.bold)
        
            Spacer().frame(height: 100)
            
            Text(vm.price.formatAsCurrency() ?? "")
            Slider(value: $vm.price, in: 0...500, step: 1.0)
            
            Text("Popular Filters")
                .fontWeight(.bold)
                .padding(.top, 40)
                .padding(.bottom, 10)
            
            // popular filters
            ForEach(PopularFilters.allCases, id: \.self) { filter in
                HStack {
                    Image(systemName: vm.containsFilter(filter.rawValue) ? "checkmark.square.fill": "square")
                        .onTapGesture {
                            if !vm.containsFilter(filter.rawValue) {
                                vm.popularFilters.append(filter)
                            } else {
                                vm.popularFilters.removeAll { $0.rawValue == filter.rawValue }
                            }
                        }
                    Text(filter.rawValue)
                }
            }
            
            // Rating Filter
            Text("Rating")
                .fontWeight(.bold)
                .padding(.top, 40)
            
            HStack {
            ForEach(1...5, id: \.self) { rating in
                Rectangle()
                    .fill(vm.rating == rating ? .blue: .gray)
                    .frame(width: 50, height: 50)
                    .overlay {
                        Text("\(rating)")
                            .foregroundColor(.white)
                    }.onTapGesture {
                        vm.rating = rating
                    }
            }}
            
            Button {
                // action
                let vs = FilterViewState(price: vm.price, rating: vm.rating, popularFilters: vm.popularFilters)
                onFilterApplied(vs)
                dismiss() 
                
            } label: {
                Text("Apply")
                    .frame(maxWidth: .infinity, maxHeight: 44)
            }.padding(.top, 40)
                .buttonStyle(.borderedProminent)

            
            Spacer()
            
        }.padding()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(vm:  FilterViewModel()) { _ in
            
        }
    }
}
