//
//  AniiChanApp.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI
import ComposableArchitecture
@main
struct AniiChanApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                MediaListView(
                    store: Store(
                        initialState: MediaListFeature.State(
                            selectedPage: .anime,
                            visibleMedia: [
                                MediaListItemModel(
                                    name: "Mononoke",
                                    state: .inProgress,
                                    currentEpisode: 7,
                                    totalEpisodes: 11,
                                    userScore: 0
                                ),
                                MediaListItemModel(
                                    name: "Cowboy Bebop",
                                    state: .inProgress,
                                    currentEpisode: 15,
                                    totalEpisodes: 26,
                                    userScore: 0
                                ),
                                MediaListItemModel(
                                    name: "Neon Genesis Evangelion",
                                    state: .completed,
                                    currentEpisode: 1,
                                    totalEpisodes: 1,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "The End of Evangelion",
                                    state: .completed,
                                    currentEpisode: 25,
                                    totalEpisodes: 25,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "Tale of the princess Kaguya",
                                    state: .completed,
                                    currentEpisode: 1,
                                    totalEpisodes: 1,
                                    userScore: 10
                                ),
                                MediaListItemModel(
                                    name: "Tsuritama",
                                    state: .completed,
                                    currentEpisode: 13,
                                    totalEpisodes: 13,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "Uchoten Kazoku",
                                    state: .onHold,
                                    currentEpisode: 11,
                                    totalEpisodes: 13,
                                    userScore: 6
                                ),
                                MediaListItemModel(
                                    name: "Chainsaw Man",
                                    state: .dropped,
                                    currentEpisode: 1,
                                    totalEpisodes: 12,
                                    userScore: 1
                                ),
                                MediaListItemModel(
                                    name: "Aria the Origination",
                                    state: .planning,
                                    currentEpisode: 0,
                                    totalEpisodes: 24,
                                    userScore: 0
                                ),
                            ],
                            userAnimeList: [
                                MediaListItemModel(
                                    name: "Mononoke",
                                    state: .inProgress,
                                    currentEpisode: 7,
                                    totalEpisodes: 11,
                                    userScore: 0
                                ),
                                MediaListItemModel(
                                    name: "Cowboy Bebop",
                                    state: .inProgress,
                                    currentEpisode: 15,
                                    totalEpisodes: 26,
                                    userScore: 0
                                ),
                                MediaListItemModel(
                                    name: "Neon Genesis Evangelion",
                                    state: .completed,
                                    currentEpisode: 1,
                                    totalEpisodes: 1,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "The End of Evangelion",
                                    state: .completed,
                                    currentEpisode: 25,
                                    totalEpisodes: 25,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "Tale of the princess Kaguya",
                                    state: .completed,
                                    currentEpisode: 1,
                                    totalEpisodes: 1,
                                    userScore: 10
                                ),
                                MediaListItemModel(
                                    name: "Tsuritama",
                                    state: .completed,
                                    currentEpisode: 13,
                                    totalEpisodes: 13,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "Uchoten Kazoku",
                                    state: .onHold,
                                    currentEpisode: 11,
                                    totalEpisodes: 13,
                                    userScore: 6
                                ),
                                MediaListItemModel(
                                    name: "Chainsaw Man",
                                    state: .dropped,
                                    currentEpisode: 1,
                                    totalEpisodes: 12,
                                    userScore: 1
                                ),
                                MediaListItemModel(
                                    name: "Aria the Origination",
                                    state: .planning,
                                    currentEpisode: 0,
                                    totalEpisodes: 24,
                                    userScore: 0
                                ),
                            ],
                            userMangaList: [
                                MediaListItemModel(
                                    name: "Mononoke",
                                    state: .inProgress,
                                    currentEpisode: 7,
                                    totalEpisodes: 11,
                                    userScore: 0
                                ),
                                MediaListItemModel(
                                    name: "Cowboy Bebop",
                                    state: .planning,
                                    currentEpisode: 15,
                                    totalEpisodes: 26,
                                    userScore: 0
                                ),
                                MediaListItemModel(
                                    name: "Neon Genesis Evangelion",
                                    state: .completed,
                                    currentEpisode: 1,
                                    totalEpisodes: 1,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "The End of Evangelion",
                                    state: .completed,
                                    currentEpisode: 25,
                                    totalEpisodes: 25,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "Tale of the princess Kaguya",
                                    state: .completed,
                                    currentEpisode: 1,
                                    totalEpisodes: 1,
                                    userScore: 10
                                ),
                                MediaListItemModel(
                                    name: "Tsuritama",
                                    state: .completed,
                                    currentEpisode: 13,
                                    totalEpisodes: 13,
                                    userScore: 8
                                ),
                                MediaListItemModel(
                                    name: "Uchoten Kazoku",
                                    state: .onHold,
                                    currentEpisode: 11,
                                    totalEpisodes: 13,
                                    userScore: 6
                                ),
                                MediaListItemModel(
                                    name: "Chainsaw Man",
                                    state: .dropped,
                                    currentEpisode: 1,
                                    totalEpisodes: 12,
                                    userScore: 1
                                ),
                                MediaListItemModel(
                                    name: "Aria the Origination",
                                    state: .planning,
                                    currentEpisode: 0,
                                    totalEpisodes: 24,
                                    userScore: 0
                                ),
                            ]
                        ),
                        reducer: {
                            MediaListFeature()
                        }
                    ),
                    isPresented: false
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
