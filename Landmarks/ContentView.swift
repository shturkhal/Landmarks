//
//  ContentView.swift
//  Landmarks
//
//  Created by Іван Штурхаль on 30.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundColor(isNight: isNight)
            VStack(spacing: 10) {
                CityTextName(cityName: "Dnipro, UA")
                MainWetherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill" , temperature: 78)

                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 78)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.rain.fill",
                                   temperature: 70)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 25)
                }
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                    print("tapped")
                }, label: {
                    WeatherButton(title: "Change day time",
                                  textColor: .white,
                                  backgroundColor: .purple)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundColor: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(
//            colors: [isNight ? Color.darkerBlue : .blue, 
//                     isNight ? Color.black: Color.lightBlue]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextName: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct MainWetherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40)
    }
    
}


