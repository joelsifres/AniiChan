//
//  AniiChanApp.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI

@main
struct AniiChanApp: App {
    var body: some Scene {
        WindowGroup {
            MediaListView(
                viewModel: MediaListViewModel(
                    userAnimeLists: [
                        MediaListItemModel(
                            name: "Mononoke",
                            state: .watching,
                            currentEpisode: 7,
                            totalEpisodes: 11
                        ),
                        MediaListItemModel(
                            name: "Cowboy Bebop",
                            state: .watching,
                            currentEpisode: 15,
                            totalEpisodes: 26
                        ),
                        MediaListItemModel(
                            name: "Neon Genesis Evangelion",
                            state: .completed,
                            currentEpisode: 25,
                            totalEpisodes: 25
                        ),
                        MediaListItemModel(
                            name: "Neon Genesis Evangelion",
                            state: .completed,
                            currentEpisode: 25,
                            totalEpisodes: 25
                        ),
                        MediaListItemModel(
                            name: "Tale of the princess Kaguya",
                            state: .completed,
                            currentEpisode: 1,
                            totalEpisodes: 1
                        ),
                        MediaListItemModel(
                            name: "Tsuritama",
                            state: .completed,
                            currentEpisode: 13,
                            totalEpisodes: 13
                        ),
                        MediaListItemModel(
                            name: "Uchoten Kazoku",
                            state: .onHold,
                            currentEpisode: 11,
                            totalEpisodes: 13
                        ),
                        MediaListItemModel(
                            name: "Chainsaw Man",
                            state: .dropped,
                            currentEpisode: 1,
                            totalEpisodes: 12
                        ),
                        MediaListItemModel(
                            name: "Aria the Origination",
                            state: .planToWatch,
                            currentEpisode: 0,
                            totalEpisodes: 24
                        ),
                    ],
                    userMangaList: [
                    ]
                )
            )
        }
    }
}
