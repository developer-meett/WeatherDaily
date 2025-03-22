//
//  ContentView.swift
//  WeatherDaily
//
//  Created by student on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
               if let weather = weather {
                   WeatherView(weather: weather)
               }else{
                   LoadingView()
                       .task {
                           do{
                               try await
                              weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                   
                           }catch {
                               print("error getting weather",error)
                           }
                       }
               }
            }else{
                if locationManager.isloading{
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color.gray.opacity(0.1))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
