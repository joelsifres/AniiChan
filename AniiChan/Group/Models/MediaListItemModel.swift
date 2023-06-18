//
//  MediaListItemModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import Foundation

struct MediaListItemModel: Identifiable {
    enum MediaItemState: String, CaseIterable, Identifiable {
        case watching = "Watching"
        case completed = "Completed"
        case onHold = "On hold"
        case dropped = "Dropped"
        case planToWatch = "Plan to Watch"
        
        var id: String {
            self.rawValue
        }
    }
    
    let id = UUID()
    
    var name: String
    var state: MediaItemState
    var currentEpisode: Int
    var totalEpisodes: Int

    mutating func increaseCurrentEpisode() {
        guard state == .watching else { return }

        currentEpisode = currentEpisode + 1

        if currentEpisode == totalEpisodes {
            state = .completed
        }
    }
}

extension MediaListItemModel {
    static func map(to model: MediaItemModel) {
        
    }
}
