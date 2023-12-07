//
//  MediaStateView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 23/6/23.
//

import SwiftUI

struct MediaStateView: View {
    @Binding var state: MediaState
    
    var body: some View {
        Menu {
            ForEach(MediaState.allCases) { state in
                Button {
                    self.state = state
                } label: {
                    Text(state.stringValue(for: .anime))
                }
            }
        } label: {
            Text(state.stringValue(for: .anime))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            Image(systemName: "chevron.down")
        }
        .background(Material.ultraThin)
        .buttonStyle(.bordered)
    }
}

#Preview {
    MediaStateView(state: .constant(.completed))
}
