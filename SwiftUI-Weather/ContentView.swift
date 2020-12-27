//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Student Laptop_7/19_1 on 12/26/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "San Francisco, CA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temp: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(weekday: "TUE",
                                   weatherImage: "cloud.drizzle.fill",
                                   temp: 60)
                    
                    WeatherDayView(weekday: "WED",
                                   weatherImage: "cloud.sun.rain.fill",
                                   temp: 74)
                    
                    WeatherDayView(weekday: "THU",
                                   weatherImage: "wind.snow",
                                   temp: 40)
                    
                    WeatherDayView(weekday: "FRI",
                                   weatherImage: "sun.max.fill",
                                   temp: 85)
                    
                    WeatherDayView(weekday: "SAT",
                                   weatherImage: "cloud.sun.rain.fill",
                                   temp: 70)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherDayView: View {
    
    var weekday: String
    var weatherImage: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(weekday)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)")
                .font(.system(size: 50, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray :Color("lightBlue")]),
                       startPoint:.topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
