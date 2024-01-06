//
//  WeatherButton.swift
//  Landmarks
//
//  Created by Іван Штурхаль on 03.01.2024.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(textColor)
            .background(backgroundColor.gradient)
            .cornerRadius(10)
    }
}


struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title",
                      textColor: .white,
                      backgroundColor: .blue)
    }
}
