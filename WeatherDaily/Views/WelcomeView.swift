//
//  WelcomeView.swift
//  WeatherDaily
//
//  Created by student on 21/03/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing : 20){
                Text("Welcome to the weather App")
                    .bold().font(.title)
                
                Text("please share your current to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
