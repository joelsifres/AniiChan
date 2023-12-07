//
//  MediDetailFeature.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 6/12/23.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MediaDetailFeature {
    @ObservableState
    struct State {
        var media: MediaItemModel
        
        init(media: MediaItemModel) {
            self.media = media
        }
    }
    
    enum Action {
        case onStateChanged(MediaState)
        case onCurrentEpisodeChanged(Int)
        case shareMediaEntryTapped
        case editUserMediaEntryTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onStateChanged(let newState):
                state.media.state = newState
                return .none
                
            case .onCurrentEpisodeChanged(let newEpisode):
                state.media.currentEpisode = newEpisode
                return .none
                
            case .shareMediaEntryTapped:
                return .none
                
            case .editUserMediaEntryTapped:
                // Open ListEntryEditor
                return .none
            }
        }
    }
}
