//
//  MediaListView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI

struct MediaListView: View {
    @ObservedObject var viewModel: MediaListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(MediaListItemModel.MediaItemState.allCases) { state in
                        Section(state.rawValue) {
                            ForEach($viewModel.userAnimeList.filter { $0.wrappedValue.state == state }.sorted(by: { $0.wrappedValue.name < $1.wrappedValue.name
                            })) { $entry in
                                // Have the MediaRowView as a navigation link to the anime detail instead of as an expandable view
                                NavigationLink {
                                    // TBD
                                    Text("Detail View")
                                } label: {
                                    MediaRowView(model: $entry)
                                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                            // Disable swipe action if row is expanded?
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
                                                // Open PopOver
                                            } label: {
                                                Image(systemName: "square.and.pencil.circle.fill")
                                            }
                                            .tint(.orange)
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Kipik's List")
            .toolbar {
                Button {

                } label: {
                    Image(systemName: "line.2.horizontal.decrease.circle")
                }
                Button {

                } label: {
                    Image(systemName: "arrow.up.arrow.down.circle")
                }
            }
        }
    }
}

struct MediaListView_Previews: PreviewProvider {
    
    static let viewModel = MediaListViewModel(
        userAnimeLists: [
            MediaListItemModel(
                name: "Neon Genesis Evangelion",
                state: .watching,
                currentEpisode: 0,
                totalEpisodes: 12
            ),
            MediaListItemModel(
                name: "Neon Genesis Evangelion",
                state: .watching,
                currentEpisode: 0,
                totalEpisodes: 12
            ),
            MediaListItemModel(
                name: "The Wind Rises",
                state: .completed,
                currentEpisode: 1,
                totalEpisodes: 1
            ),
            MediaListItemModel(
                name: "Uchoten Kazoku",
                state: .onHold,
                currentEpisode: 11,
                totalEpisodes: 13
            ),
            MediaListItemModel(
                name: "Neon Genesis Evangelion",
                state: .dropped,
                currentEpisode: 1,
                totalEpisodes: 25
            ),
            MediaListItemModel(
                name: "Neon Genesis Evangelion",
                state: .planToWatch,
                currentEpisode: 1,
                totalEpisodes: 25
            )
        ],
        userMangaList: []
    )
    
    static var previews: some View {
        MediaListView(viewModel: viewModel)
    }
}
