//
//  RatingSmileyView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 19/6/23.
//

import SwiftUI

enum RatingSmiley: String, CaseIterable {
    case smile = "🙂"
    case neutral = "😐"
    case sad = "😦"
    
    var doubleValue: Double {
        switch self {
        case .smile:
            return 0
        case .neutral:
            return 1.5
        case .sad:
            return 3
        }
    }
    
    func value(for double: Double) -> Self {
        switch double {
        case 0:
            return .smile
        case 0.01...2.99:
            return .neutral
        default:
            return .sad
        }
    }
}

final class RatingSmileyViewModel: ObservableObject {
    
    @Published var rating: RatingSmiley
    @Published var value: Double {
        willSet {
            rating = rating.value(for: newValue)
        }
    }
    @Published var lastCoordinateValue: CGFloat
    
    var maxValue: Double = 0.0
    var scaleFactor: Double = 0.0
    var sliderVal: Double = 0.0
    
    init(rating: RatingSmiley) {
        self.rating = rating
        self.value = rating.doubleValue
        self.lastCoordinateValue = 0.0
    }
    
    func update(_ maxValue: Double) {
        self.maxValue = maxValue
        self.scaleFactor = maxValue / Double(RatingSmiley.allCases.count)
        self.sliderVal = value * scaleFactor
    }
    
    func calculate(_ height: CGFloat) {
        if (abs(height) < 0.1) {
            lastCoordinateValue = sliderVal
        }
        if height > 0 {
            let nextCoordinateValue = min(maxValue, lastCoordinateValue + height)
            value = (nextCoordinateValue / scaleFactor)
        } else {
            let nextCoordinateValue = max(0.0, lastCoordinateValue + height)
            value = (nextCoordinateValue / scaleFactor)
        }
    }
}

struct RatingSmileyView: View {
    
    @ObservedObject var viewModel: RatingSmileyViewModel
    
    var smileySize: Double = 25
    var spacing: Double = 4
    
    var body: some View {
        GeometryReader { geometry in
            let _ = viewModel.update(geometry.size.height)
            
            Text(viewModel.rating.rawValue)
                .frame(width: smileySize, height: smileySize)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { v in
                            viewModel.calculate(v.translation.height)
                        }
                )
        }
        .frame(width: smileySize, height: smileySize)
    }
}

struct RatingSmileyView_Previews: PreviewProvider {
    static var previews: some View {
        RatingSmileyView(viewModel: RatingSmileyViewModel(rating: .smile))
    }
}
