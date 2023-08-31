//
//  MediaListView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI
import Observation

struct MediaListView: View {
    @Bindable var viewModel: MediaListViewModel
    
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(MediaListItemModel.MediaItemState.allCases) { state in
                        Section {
                            ForEach($viewModel.selectedList.filter { $0.wrappedValue.state == state }) { $entry in
                                NavigationLink {
                                    MediaDetailView(viewModel: MediaDetailViewModel())
                                } label: {
                                    ListMediaRowView(model: $entry)
                                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                            Button {
                                                entry.increaseCurrentEpisode()
                                            } label: {
                                                Image(systemName: "plus.circle.fill")
                                            }
                                            .tint(.green)
                                            .disabled(entry.state != .watching)
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
                            Text(state.rawValue)
                        } footer: {
                            HStack {
                                Spacer()
                                
                                Text("\($viewModel.selectedList.filter { $0.wrappedValue.state == state }.count) entries")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Kipik's \(viewModel.selectedPage == .anime ? "Anime" : "Manga") List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.toggleOrder()
                    } label: {
                        Image(systemName: viewModel.currentSortingFilterOrder == .ascending ? "arrow.up" : "arrow.down")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        ForEach(MediaListViewModel.SortingFilter.allCases) { filter in
                            Button {
                                viewModel.sort(by: filter)
                            } label: {
                                Text(filter.stringValue)
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .toolbarTitleMenu {
                Button {
                    viewModel.setSelectedPage(to: .anime)
                } label: {
                    Text("Anime")
                    Image(systemName: "play.rectangle")
                }
                
                Button {
                    viewModel.setSelectedPage(to: .manga)
                } label: {
                    Text("Manga")
                    Image(systemName: "book")
                }
            }
            .searchable(text: $viewModel.searchWord, prompt: "Search Kipik's List")
            .sheet(isPresented: $isPresented) {
                ListEntryEditorView(viewModel: ListEntryEditorViewModel())
            }
        }
    }
}

struct MediaListView_Previews: PreviewProvider {
    
    static let viewModel = MediaListViewModel(
        userAnimeLists: [
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
        ],
        userMangaList: []
    )
    
    static var previews: some View {
        MediaListView(viewModel: viewModel)
    }
}
