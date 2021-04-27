//
//  SplashScreenView.swift
//  RecipeApp
//
//  Created by Samim Hakimi on 4/26/21.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @State var isNight = false
    
    var body: some View {
        
        ZStack {
            
            BackgroundView(isNight: $isNight)
           
            VStack {
                CityNameView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 77)
                
                HStack(spacing:45) {
                  
                   
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 66)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.rain.fill", temperature: 76)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 88)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 98)
                    
                   
                }
               
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: isNight ? .black : .blue, backgroundColor: Color.white)
                }
                Spacer()
            }
        }
    }
}


struct BackgroundView : View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .white : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
    
}

struct CityNameView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 44))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("\(temperature)°")
                .font(.system(size: 44))
                .foregroundColor(.white)
        
        }
        .padding(.bottom, 44)
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        Text(title)
            .frame(width: 300, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}


