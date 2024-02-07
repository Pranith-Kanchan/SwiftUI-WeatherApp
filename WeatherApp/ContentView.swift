//
//  ContentView.swift
//  WeatherApp
//
//  Created by croma on 06/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDark: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: isDark ? [.black, .white] : [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
              
                Text("Manglore")
                    .font(.system(size: 40,weight: .medium, design: .default))
                    .foregroundColor(.white)
                
                
                MainWeather(weatherImg: isDark ? "moon.stars.fill" : "cloud.sun.fill"  )
                
                HStack{
                    
                    WeatherDayView(dayOfWeek: "Mon", imageOfWeath: "cloud.sun.fill", degree: "43°")
                    WeatherDayView(dayOfWeek: "Mon", imageOfWeath: "cloud.sun.bolt.fill", degree: "74°")
                    WeatherDayView(dayOfWeek: "Mon", imageOfWeath: "sun.snow.fill", degree: "50°")
                    WeatherDayView(dayOfWeek: "Mon", imageOfWeath: "cloud.sun.fill", degree: "66°")
                    WeatherDayView(dayOfWeek: "Mon", imageOfWeath: "sun.horizon.fill", degree: "20°")
                }
                
                Spacer()
                
                Button(action: {
                    isDark.toggle()
                      })
                {
                    Text("Change the mode")
                        .font(.system(size: 20,weight: .bold))
                    
                        .frame(width: 300,height: 55)
                        .background(.white.gradient)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageOfWeath: String
    var degree: String
    
    var body: some View {
        VStack{
            Image(systemName: imageOfWeath)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60,height: 60)
            Text(dayOfWeek)
                .font(.system(size: 20,weight: .bold, design: .default))
                .foregroundColor(.white)
            Text(degree)
                .font(.system(size: 20,weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct MainWeather: View {
    
    var weatherImg: String
    var body: some View {
        VStack(spacing:0){
            Image(systemName: weatherImg)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            
            Text("70°")
                .font(.system(size: 55,weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}
