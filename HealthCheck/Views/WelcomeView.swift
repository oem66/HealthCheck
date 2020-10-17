//
//  WelcomeView.swift
//  HealthCheck
//
//  Created by Omer Rahmanovic on 10/17/20.
//

import SwiftUI
import HealthKit

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("healthcare")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180, alignment: .center)
                
                Text("    Virtual Health \n   and monitoring")
                    .font(.custom("Avenir-Medium", size: 28))
                    .foregroundColor(.black)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                    .padding(.top, 20)
                
                Text("Quality healthcare starts \n    with quality lifestyle")
                    .font(.custom("Avenir-Medium", size: 20))
                    .foregroundColor(.gray)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                    .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: HomeView()) {
                    Text("Get Started")
                        .bold()
                        .font(.custom("Avenir-Medium", size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .minimumScaleFactor(0.5)
                }
                .background(Color.black)
                .cornerRadius(8.0)
                .padding(.bottom, 50)
                
            }
            .padding()
            
        }.onAppear {
            HealthKitHelper().isHealthKitAvailable { (result) in
                print("Result: \(result)")
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
