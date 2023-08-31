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
            TabView {
                MediaListView(
                    viewModel: MediaListViewModel(
                        userAnimeLists: [
                            MediaListItemModel(
                                name: "Mononoke",
                                state: .watching,
                                currentEpisode: 7,
                                totalEpisodes: 11,
                                score: 0
                            ),
                            MediaListItemModel(
                                name: "Cowboy Bebop",
                                state: .watching,
                                currentEpisode: 15,
                                totalEpisodes: 26,
                                score: 0
                            ),
                            MediaListItemModel(
                                name: "Neon Genesis Evangelion",
                                state: .completed,
                                currentEpisode: 1,
                                totalEpisodes: 1,
                                score: 8
                            ),
                            MediaListItemModel(
                                name: "The End of Evangelion",
                                state: .completed,
                                currentEpisode: 25,
                                totalEpisodes: 25,
                                score: 8
                            ),
                            MediaListItemModel(
                                name: "Tale of the princess Kaguya",
                                state: .completed,
                                currentEpisode: 1,
                                totalEpisodes: 1,
                                score: 10
                            ),
                            MediaListItemModel(
                                name: "Tsuritama",
                                state: .completed,
                                currentEpisode: 13,
                                totalEpisodes: 13,
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
                                totalEpisodes: 12,
                                score: 1
                            ),
                            MediaListItemModel(
                                name: "Aria the Origination",
                                state: .planToWatch,
                                currentEpisode: 0,
                                totalEpisodes: 24,
                                score: 0
                            ),
                        ],
                        userMangaList: [
                            MediaListItemModel(
                                name: "Oyasumi Punpun",
                                state: .completed,
                                currentEpisode: 24,
                                totalEpisodes: 24,
                                score: 10
                            )
                        ]
                    )
                )
                .tabItem {
                    Label("Your List", systemImage: "list.bullet")
                }
                
                ExploreView(viewModel: ExploreViewModel())
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
        }
    }
}
