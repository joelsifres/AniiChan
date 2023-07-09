//
//  MediaStateView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 23/6/23.
//

import SwiftUI

struct MediaStateView: View {
    @Binding var state: MediaItemModel.AnimeMediaState
    
    var body: some View {
        Menu {
            ForEach(MediaItemModel.AnimeMediaState.allCases) { state in
                Button {
                    self.state = state
                } label: {
                    Text(state.rawValue)
                }
            }
        } label: {
            Text(state.rawValue)
            Image(systemName: "chevron.down")
        }
        .background(Material.ultraThin)
        .buttonStyle(.bordered)
    }
}

struct MediaStateView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStateView(state: .constant(.addToList))
    }
}
