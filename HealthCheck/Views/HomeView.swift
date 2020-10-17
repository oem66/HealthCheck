//
//  ContentView.swift
//  HealthCheck
//
//  Created by Omer Rahmanovic on 10/17/20.
//

import SwiftUI
import HealthKit

struct HomeView: View {
    
    let healthStore = HealthKitHelper().healthStore
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
