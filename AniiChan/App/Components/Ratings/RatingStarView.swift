//
//  RatingStarView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 19/6/23.
//
//  Following the logic from this article by Eric Callanan:
//  https://swdevnotes.com/swift/2022/create-a-star-rating-swiftui-component/



import SwiftUI

final class RatingStarViewModel: ObservableObject, EditableSmileyProtocol {
    
    var STARS: Int = 5
    
    @Published var rating: Double
    var value: Double {
        willSet {
            rating = newValue
        }
    }
    
    var lastCoordinateValue: CGFloat
    var maxValue: Double = 0.0
    var scaleFactor: Double = 0.0
    var sliderVal: Double = 0.0
    
    init(rating: Double) {
        self.rating = rating
        self.value = rating
        self.lastCoordinateValue = 0.0
    }
    
    func update(_ maxValue: Double) {
        self.maxValue = maxValue
        self.scaleFactor = maxValue / Double(STARS)
        self.sliderVal = self.value * scaleFactor
    }
    
    func calculate(_ size: CGFloat) {
        if (abs(size) < 0.1) {
            lastCoordinateValue = sliderVal
        }
        if size > 0 {
            let nextCoordinateValue = min(maxValue, lastCoordinateValue + size)
            value = (nextCoordinateValue / scaleFactor)
        } else {
            let nextCoordinateValue = max(0.0, lastCoordinateValue + size)
            value = (nextCoordinateValue / scaleFactor)
        }
    }
}

struct RatingStarView: View {
    
    @ObservedObject var viewModel: RatingStarViewModel
    
    var starWidth: Double = 25
    var spacing: Double = 4
    
    var body: some View {
        GeometryReader { geometry in
            let _ = viewModel.update(geometry.size.width)
            
            HStack(spacing: spacing) {
                ForEach(1...viewModel.STARS, id: \.self) { index in
                    if Double(index) - viewModel.value >= 0.75 {
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                    } else if Double(index) - viewModel.value < 0.75 && Double(index) - viewModel.value >= 0.25 {
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
                        viewModel.calculate(v.translation.width)
                    }
            )
        }
        .frame(width: (starWidth * Double(viewModel.STARS)) + (spacing * Double(viewModel.STARS - 1)), height: starWidth)
    }
}

struct RatingStarView_Previews: PreviewProvider {
    
    static var previews: some View {
        RatingStarView(viewModel: RatingStarViewModel(rating: 0.25))
    }
}
