//
//  MediaProgressView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 23/6/23.
//

import SwiftUI

struct MediaProgressView: View {
    @Binding var progress: Int
    let totalProgress: Int
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                Picker("Progress", selection: $progress) {
                    ForEach(0...totalProgress, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.menu)
                
                Text("/   \(totalProgress) episodes")
            }
        }
    }
}

struct MediaProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MediaProgressView(progress: .constant(5), totalProgress: 12)
    }
}
