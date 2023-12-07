//
//  RootFeature.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 7/12/23.
//

import Foundation
import ComposableArchitecture

@Reducer
struct Root {
    
    @ObservableState
    struct State {
        var selectedTab: Tab = .list
        var userMediaListState = MediaList.State(
            selectedPage: .anime,
            visibleMedia: [
                MediaItemModel(
                    name: "Mononoke",
                    state: .inProgress,
                    currentEpisode: 7,
                    totalEpisodes: 11,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Cowboy Bebop",
                    state: .inProgress,
                    currentEpisode: 15,
                    totalEpisodes: 26,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Neon Genesis Evangelion",
                    state: .completed,
                    currentEpisode: 1,
                    totalEpisodes: 1,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "The End of Evangelion",
                    state: .completed,
                    currentEpisode: 25,
                    totalEpisodes: 25,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Tale of the princess Kaguya",
                    state: .completed,
                    currentEpisode: 1,
                    totalEpisodes: 1,
                    userScore: 10,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Tsuritama",
                    state: .completed,
                    currentEpisode: 13,
                    totalEpisodes: 13,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Uchoten Kazoku",
                    state: .onHold,
                    currentEpisode: 11,
                    totalEpisodes: 13,
                    userScore: 6,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Chainsaw Man",
                    state: .dropped,
                    currentEpisode: 1,
                    totalEpisodes: 12,
                    userScore: 1,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Aria the Origination",
                    state: .planning,
                    currentEpisode: 0,
                    totalEpisodes: 24,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
            ],
            userAnimeList: [
                MediaItemModel(
                    name: "Mononoke",
                    state: .inProgress,
                    currentEpisode: 7,
                    totalEpisodes: 11,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Cowboy Bebop",
                    state: .inProgress,
                    currentEpisode: 15,
                    totalEpisodes: 26,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Neon Genesis Evangelion",
                    state: .completed,
                    currentEpisode: 1,
                    totalEpisodes: 1,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "The End of Evangelion",
                    state: .completed,
                    currentEpisode: 25,
                    totalEpisodes: 25,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Tale of the princess Kaguya",
                    state: .completed,
                    currentEpisode: 1,
                    totalEpisodes: 1,
                    userScore: 10,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Tsuritama",
                    state: .completed,
                    currentEpisode: 13,
                    totalEpisodes: 13,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Uchoten Kazoku",
                    state: .onHold,
                    currentEpisode: 11,
                    totalEpisodes: 13,
                    userScore: 6,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Chainsaw Man",
                    state: .dropped,
                    currentEpisode: 1,
                    totalEpisodes: 12,
                    userScore: 1,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Aria the Origination",
                    state: .planning,
                    currentEpisode: 0,
                    totalEpisodes: 24,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
            ],
            userMangaList: [
                MediaItemModel(
                    name: "Mononoke",
                    state: .inProgress,
                    currentEpisode: 7,
                    totalEpisodes: 11,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Cowboy Bebop",
                    state: .inProgress,
                    currentEpisode: 15,
                    totalEpisodes: 26,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Neon Genesis Evangelion",
                    state: .completed,
                    currentEpisode: 1,
                    totalEpisodes: 1,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "The End of Evangelion",
                    state: .completed,
                    currentEpisode: 25,
                    totalEpisodes: 25,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Tale of the princess Kaguya",
                    state: .completed,
                    currentEpisode: 1,
                    totalEpisodes: 1,
                    userScore: 10,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Tsuritama",
                    state: .completed,
                    currentEpisode: 13,
                    totalEpisodes: 13,
                    userScore: 8,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Uchoten Kazoku",
                    state: .onHold,
                    currentEpisode: 11,
                    totalEpisodes: 13,
                    userScore: 6,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Chainsaw Man",
                    state: .dropped,
                    currentEpisode: 1,
                    totalEpisodes: 12,
                    userScore: 1,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
                MediaItemModel(
                    name: "Aria the Origination",
                    state: .planning,
                    currentEpisode: 0,
                    totalEpisodes: 24,
                    userScore: 0,
                    startDate: Date(),
                    endDate: Date(),
                    rewatches: 0,
                    notes: "",
                    imageURLString: ""
                ),
            ]
        )
    }
    
    enum Tab {
        case list
        case explore
        case profile
    }
    
    enum Action {
        case tabSelected(Tab)
        case userMediaList(MediaList.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .tabSelected(let tab):
                state.selectedTab = tab
                return .none
                
            case .userMediaList(_):
                return .none
            }
        }
    }
}
