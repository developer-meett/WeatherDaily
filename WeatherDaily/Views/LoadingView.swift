//
//  LoadingView.swift
//  WeatherDaily
//
//  Created by student on 21/03/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .tint(.blue)  
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    LoadingView()
}
