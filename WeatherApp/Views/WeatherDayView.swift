//
//  WeatherDayView.swift
//  RecipeApp
//
//  Created by Samim Hakimi on 4/26/21.
//

import Foundation
import SwiftUI

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18))
                .foregroundColor(Color.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 38, height: 38)
                
            
            Text("\(temperature)°")
                .font(.system(size: 18))
                .foregroundColor(.white)
            
        }
    }
}
