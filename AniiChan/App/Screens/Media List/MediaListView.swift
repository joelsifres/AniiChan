//
//  MediaListView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI
import Observation
import ComposableArchitecture
import IdentifiedCollections


struct MediaListView: View {
    
    @Bindable var store: StoreOf<MediaList>
    
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            VStack {
                List {
                    ForEach(MediaState.allCases) { state in
                        if store.visibleMedia.filter({ $0.state == state }).isEmpty == false {
                            Section {
                                ForEach(store.visibleMedia.filter { $0.state == state }) { entry in
                                    NavigationLink(
                                        state: MediaDetail.State(media: entry)
                                    ) {
                                        ListMediaRowView(model: entry)
                                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                                Button {
                                                    store.send(.onIncreaseCurrentEpisode(entry))
                                                } label: {
                                                    Image(systemName: "plus.circle.fill")
                                                }
                                                .tint(.green)
                                                .disabled(entry.state != .inProgress)
                                            }
                                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                                Button {
                                                    self.isPresented.toggle()
                                                } label: {
                                                    Image(systemName: "square.and.pencil.circle.fill")
                                                }
                                                .tint(.orange)
                                            }
                                    }
                                }
                            } header: {
                                Text(state.stringValue(for: store.selectedPage))
                            } footer: {
                                HStack {
                                    Spacer()
                                    
                                    Text("\(store.visibleMedia.filter { $0.state == state }.count) entries")
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Kipik's \(store.selectedPage == .anime ? "Anime" : "Manga") List")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Section {
                                ForEach(SortingFilter.allCases) { filter in
                                    Button {
                                        store.send(.sort(filter))
                                    } label: {
                                        Text(filter.stringValue)
                                    }
                                }
                            }
                            
                            Section {
                                Button {
                                    store.send(.toggleOrder)
                                } label: {
                                    Text(store.currentSortingFilterOrder == .ascending ? "Ascending" : "Descending")
                                    Image(systemName: store.currentSortingFilterOrder == .ascending ? "arrow.up" : "arrow.down")
                                }
                            }
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                    }
                }
                .toolbarTitleMenu {
                    Button {
                        store.send(.setSelectedPage(.anime))
                    } label: {
                        Text("Anime")
                        Image(systemName: "play.rectangle")
                    }
                    
                    Button {
                        store.send(.setSelectedPage(.manga))
                    } label: {
                        Text("Manga")
                        Image(systemName: "book")
                    }
                }
                .sheet(isPresented: $isPresented) {
                    ListEntryEditorView(viewModel: ListEntryEditorViewModel())
                }
                .searchable(text: $store.searchWord.sending(\.onSearchWordChanged), prompt: "Search Kipik's List")
            }
        } destination: { store in
            MediaDetailView(store: store)
        }
    }
}

#Preview("Media List View") {
    NavigationView {
        MediaListView(
            store: Store(
                initialState: MediaList.State(
                    selectedPage: .anime,
                    visibleMedia: PreviewUtils.animeList,
                    userAnimeList: PreviewUtils.animeList,
                    userMangaList: PreviewUtils.mangaList)
            ) {
                MediaList()
                    ._printChanges()
            }
        )
    }
}

fileprivate enum PreviewUtils {
    
    static let animeList: IdentifiedArrayOf<MediaItemModel> = [
//        MediaListItemModel(
//            name: "Cardcaptor Sakura",
//            state: .inProgress,
//            currentEpisode: 13,
//            totalEpisodes: 70,
//            userScore: 0
//        ),
//        MediaListItemModel(
//            name: "Cowboy Bebop",
//            state: .completed,
//            currentEpisode: 26,
//            totalEpisodes: 26,
//            userScore: 8
//        ),
//        MediaListItemModel(
//            name: "Neon Genesis Evangelion",
//            state: .completed,
//            currentEpisode: 26,
//            totalEpisodes: 26,
//            userScore: 8
//        ),
//        MediaListItemModel(
//            name: "Aku no Hana",
//            state: .completed,
//            currentEpisode: 13,
//            totalEpisodes: 13,
//            userScore: 10
//        ),
//        MediaListItemModel(
//            name: "Mousou Dairinin",
//            state: .completed,
//            currentEpisode: 13,
//            totalEpisodes: 13,
//            userScore: 6
//        ),
//        MediaListItemModel(
//            name: "The Wind Rises",
//            state: .completed,
//            currentEpisode: 1,
//            totalEpisodes: 1,
//            userScore: 10
//        ),
//        MediaListItemModel(
//            name: "Tsuritama",
//            state: .completed,
//            currentEpisode: 12,
//            totalEpisodes: 12,
//            userScore: 8
//        ),
//        MediaListItemModel(
//            name: "Uchoten Kazoku",
//            state: .onHold,
//            currentEpisode: 11,
//            totalEpisodes: 13,
//            userScore: 6
//        ),
//        MediaListItemModel(
//            name: "Chainsaw Man",
//            state: .dropped,
//            currentEpisode: 1,
//            totalEpisodes: 25,
//            userScore: 2
//        ),
//        MediaListItemModel(
//            name: "Akagge no Anne",
//            state: .planning,
//            currentEpisode: 0,
//            totalEpisodes: 50,
//            userScore: 0
//        ),
//        MediaListItemModel(
//            name: "ARIA the AVVENIRE",
//            state: .planning,
//            currentEpisode: 0,
//            totalEpisodes: 3,
//            userScore: 0
//        ),
//        MediaListItemModel(
//            name: "Bartender",
//            state: .planning,
//            currentEpisode: 0,
//            totalEpisodes: 11,
//            userScore: 0
//        )
    ]
    
    static let mangaList: IdentifiedArrayOf<MediaItemModel> = [
//        MediaListItemModel(
//            name: "Cardcaptor Sakura",
//            state: .inProgress,
//            currentEpisode: 13,
//            totalEpisodes: 70,
//            userScore: 0
//        ),
//        MediaListItemModel(
//            name: "Cowboy Bebop",
//            state: .completed,
//            currentEpisode: 26,
//            totalEpisodes: 26,
//            userScore: 8
//        ),
//        MediaListItemModel(
//            name: "Neon Genesis Evangelion",
//            state: .completed,
//            currentEpisode: 26,
//            totalEpisodes: 26,
//            userScore: 8
//        ),
//        MediaListItemModel(
//            name: "Aku no Hana",
//            state: .completed,
//            currentEpisode: 13,
//            totalEpisodes: 13,
//            userScore: 10
//        ),
//        MediaListItemModel(
//            name: "Mousou Dairinin",
//            state: .completed,
//            currentEpisode: 13,
//            totalEpisodes: 13,
//            userScore: 6
//        ),
//        MediaListItemModel(
//            name: "The Wind Rises",
//            state: .completed,
//            currentEpisode: 1,
//            totalEpisodes: 1,
//            userScore: 10
//        ),
//        MediaListItemModel(
//            name: "Tsuritama",
//            state: .completed,
//            currentEpisode: 12,
//            totalEpisodes: 12,
//            userScore: 8
//        ),
//        MediaListItemModel(
//            name: "Uchoten Kazoku",
//            state: .onHold,
//            currentEpisode: 11,
//            totalEpisodes: 13,
//            userScore: 6
//        ),
//        MediaListItemModel(
//            name: "Chainsaw Man",
//            state: .dropped,
//            currentEpisode: 1,
//            totalEpisodes: 25,
//            userScore: 2
//        ),
//        MediaListItemModel(
//            name: "Akagge no Anne",
//            state: .planning,
//            currentEpisode: 0,
//            totalEpisodes: 50,
//            userScore: 0
//        ),
//        MediaListItemModel(
//            name: "ARIA the AVVENIRE",
//            state: .planning,
//            currentEpisode: 0,
//            totalEpisodes: 3,
//            userScore: 0
//        ),
//        MediaListItemModel(
//            name: "Bartender",
//            state: .planning,
//            currentEpisode: 0,
//            totalEpisodes: 11,
//            userScore: 0
//        )
    ]
}
