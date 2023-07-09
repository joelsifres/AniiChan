//
//  ExploreSearchViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 29/6/23.
//

import Foundation
import Observation

@Observable final class ExploreSearchViewModel {
    var searchWord: String = ""
    var searchScope: SearchScope = .all
    
    var allMedia: [MediaListItemModel] = [
        MediaListItemModel(
            name: "Cardcaptor Sakura",
            state: .watching,
            currentEpisode: 13,
            totalEpisodes: 70,
            score: 0
        ),
        MediaListItemModel(
            name: "Cowboy Bebop",
            state: .completed,
            currentEpisode: 26,
            totalEpisodes: 26,
            score: 8
        ),
        MediaListItemModel(
            name: "Neon Genesis Evangelion",
            state: .completed,
            currentEpisode: 26,
            totalEpisodes: 26,
            score: 8
        ),
        MediaListItemModel(
            name: "Aku no Hana",
            state: .completed,
            currentEpisode: 13,
            totalEpisodes: 13,
            score: 10
        ),
        MediaListItemModel(
            name: "Mousou Dairinin",
            state: .completed,
            currentEpisode: 13,
            totalEpisodes: 13,
            score: 6
        ),
        MediaListItemModel(
            name: "The Wind Rises",
            state: .completed,
            currentEpisode: 1,
            totalEpisodes: 1,
            score: 10
        ),
        MediaListItemModel(
            name: "Tsuritama",
            state: .completed,
            currentEpisode: 12,
            totalEpisodes: 12,
            score: 8
        ),
        MediaListItemModel(
            name: "Uchoten Kazoku",
            state: .onHold,
            currentEpisode: 11,
            totalEpisodes: 13,
            score: 6
        ),
        MediaListItemModel(
            name: "Chainsaw Man",
            state: .dropped,
            currentEpisode: 1,
            totalEpisodes: 25,
            score: 2
        ),
        MediaListItemModel(
            name: "Akagge no Anne",
            state: .planToWatch,
            currentEpisode: 0,
            totalEpisodes: 50,
            score: 0
        ),
        MediaListItemModel(
            name: "ARIA the AVVENIRE",
            state: .planToWatch,
            currentEpisode: 0,
            totalEpisodes: 3,
            score: 0
        ),
        MediaListItemModel(
            name: "Bartender",
            state: .planToWatch,
            currentEpisode: 0,
            totalEpisodes: 11,
            score: 0
        )
    ]
    
    var searchResults: [MediaListItemModel] = []
}
