//
//  ContentView.swift
//  DeviceOrientationExample
//
//  Created by Fatih Durmaz on 24.12.2023.
//

import SwiftUI
import Lottie

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    init(){
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = apperance
        UINavigationBar.appearance().scrollEdgeAppearance = apperance
    }
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                VStack {
                    // iPad için cihaz yönü algılama geometry reader ile
                    /*
                     Text("Ekranın Konumu: \(geo.size.width > geo.size.height ? "Yatay" : "Dikey")")
                     .font(.largeTitle)
                     .bold()
                     */
                    
                    VStack {
                        Text("Ekranın Konumu: \(verticalSizeClass == .regular ? "Yatay" : "Dikey")")
                            .font(.title)
                            .bold()
                        
                        LottieView(animation: .named("orientation"))
                            .looping()
                            .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.5)
                    }
                }
                .navigationBarTitle("Device Orientation")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
