//
//  MediaListItemModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import Foundation

struct MediaListItemModel: Identifiable, Equatable {
    
    let id = UUID()
    
    var name: String
    var state: MediaState
    var currentEpisode: Int
    var totalEpisodes: Int
    var userScore: Double
    
    var releaseDate: Date = Date()
    var lastUpdated: Date = Date()
    var lastAdded: Date = Date()
}

extension MediaListItemModel {
    static func map(to model: MediaItemModel) {
        
    }
}
