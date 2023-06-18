//
//  View+PreviewBackground.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 18/6/23.
//

import SwiftUI

extension View {
    var isPreview: Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    func previewBackground() -> some View {
        self
            .background(
                isPreview ? Color(
                    UIColor(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1
                    )
                ) : Color.clear)
    }
}
