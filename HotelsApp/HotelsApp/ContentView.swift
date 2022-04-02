//
//  ContentView.swift
//  HotelsApp
//
//  Created by Mohammad Azam on 4/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @StateObject private var vm = HotelListViewModel()
    private var filterVM = FilterViewModel()
    
    var body: some View {
        
        NavigationView {
        
        HotelListView(hotels: vm.hotels)
            .task {
                await vm.populateHotels()
            }
            .navigationTitle("Estes Park")
            .toolbar {
                Button("Filters") {
                    isPresented = true
                }
            }
            
            .sheet(isPresented: $isPresented) {
                FilterView(vm: filterVM) { vs in
                    Task {
                        await vm.populateHotels(filter: vs)
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
