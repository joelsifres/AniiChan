//
//  RatingStarView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 19/6/23.
//
//  Following the logic from this article by Eric Callanan:
//  https://swdevnotes.com/swift/2022/create-a-star-rating-swiftui-component/



import SwiftUI

struct RatingStarView: View {
    
    var starWidth: Double = 25
    var spacing: Double = 4
    
    @State var value: Double
    @State var lastCoordinateValue: CGFloat = 0.0
    var stars: Int = 5
    
    var body: some View {
        GeometryReader { geometry in
            let maxValue = geometry.size.width
            let scaleFactor = maxValue / Double(stars)
            let sliderVal = self.value * scaleFactor
            
            HStack(spacing: spacing) {
                ForEach(1...stars, id: \.self) { index in
                    if Double(index) - value > 0.75 {
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                    } else if Double(index) - value < 0.75 && Double(index) - value > 0.25 {
                        Image(systemName: "star.leadinghalf.filled")
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(width: starWidth, height: starWidth)
            }
            .foregroundColor(.yellow)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { v in
                        if (abs(v.translation.width) < 0.1) {
                            self.lastCoordinateValue = sliderVal
                        }
                        if v.translation.width > 0 {
                            let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                            self.value = (nextCoordinateValue / scaleFactor)
                        } else {
                            let nextCoordinateValue = max(0.0, self.lastCoordinateValue + v.translation.width)
                            self.value = (nextCoordinateValue / scaleFactor)
                        }
                    }
            )
        }
        .frame(width: (starWidth * Double(stars)) + (spacing * Double(stars - 1)), height: starWidth)
    }
}

struct RatingStarView_Previews: PreviewProvider {
    
    static var previews: some View {
        RatingStarView(value: 0.25)
    }
}
