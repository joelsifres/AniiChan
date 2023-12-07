//
//  ExploreView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 24/6/23.
//

import SwiftUI

struct ExploreSearchView: View {
    
    var viewModel: ExploreSearchViewModel
    
    var body: some View {
        LazyVStack(spacing: 16) {
            List {
                ForEach(viewModel.searchResults, id: \.id) { result in
                    ExploreMediaRowView(model: result, index: 1)
                }
            }
        }
    }
}

struct ExploreContentView: View {
    
    @Environment(\.isSearching) private var isSearching
    @Bindable var viewModel: ExploreViewModel
    
    var body: some View {
        if !isSearching {
            switch viewModel.selectedPage {
            case .anime:
                animePage
            case .manga:
                mangaPage
            }
        } else {
            ExploreSearchView(
                viewModel: ExploreSearchViewModel()
            )
        }
    }
}

struct ExploreView: View {
    
    @Bindable var viewModel: ExploreViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ExploreContentView(viewModel: viewModel)
            }
            .navigationTitle("Explore")
            .toolbar {
                Menu {
                    Button {
                        viewModel.selectedPage = .anime
                    } label: {
                        Text("Anime")
                        Image(systemName: "play.rectangle")
                    }
                    
                    Button {
                        viewModel.selectedPage = .manga
                    } label: {
                        Text("Manga")
                        Image(systemName: "book")
                    }
                } label: {
                    Image(systemName: viewModel.selectedPage == .anime ? "play.rectangle" : "book")
                }
            }
        }
        .searchable(text: $viewModel.searchWord, placement: .navigationBarDrawer(displayMode: .automatic), prompt: "Search AniList")
        .searchScopes($viewModel.searchScope) {
            ForEach(SearchScope.allCases, id: \.self) { scope in
                Text(scope.rawValue.capitalized)
            }
        }
//        .searchSuggestions(.automatic, for: .content) {
//            Text("Dragon Ball")
//                .searchCompletion("Dragon Ball")
//            Text("Inio Asano")
//                .searchCompletion("Inio Asano")
//            Text("Hideaki Anno")
//                .searchCompletion("Hideaki Anno")
//        }
    }
}

extension ExploreContentView {
    
    var animePage: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("Trending now")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("Trending now")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "ONE PIECE")
                        MediaCardView(type: .medium, text: "Megami no Café Terrace")
                        MediaCardView(type: .medium, text: "Tonikaku Kawaii Season 2")
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("Popular manga")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("Popular manga")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                        MediaCardView(type: .medium, text: "Jigokuraku")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "Dr. STONE: NEW WORLD")
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "Tengoku Daimakyou")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("Popular manhwa")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("Popular manhwa")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                        MediaCardView(type: .medium, text: "Jigokuraku")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "Dr. STONE: NEW WORLD")
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "Tengoku Daimakyou")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("All time popular")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("All time popular")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                        MediaCardView(type: .medium, text: "Jigokuraku")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "Dr. STONE: NEW WORLD")
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "Tengoku Daimakyou")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            top100
        }
    }
    
    var mangaPage: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("Trending now")
                        .font(.title)
                        .bold()
                     
                    Spacer()
                    
                    NavigationLink {
                        Text("Trending now")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "ONE PIECE")
                        MediaCardView(type: .medium, text: "Megami no Café Terrace")
                        MediaCardView(type: .medium, text: "Tonikaku Kawaii Season 2")
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("Popular this season")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("Popular this season")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                        MediaCardView(type: .medium, text: "Jigokuraku")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "Dr. STONE: NEW WORLD")
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "Tengoku Daimakyou")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("Upcoming next season")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("Upcoming next season")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                        MediaCardView(type: .medium, text: "Jigokuraku")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "Dr. STONE: NEW WORLD")
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "Tengoku Daimakyou")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            
            VStack(alignment: .leading) {
                HStack(alignment: .bottom) {
                    Text("All time popular")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        Text("All time popular")
                    } label: {
                        Text("View all")
                    }
                }
                .padding([.top, .horizontal])
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        MediaCardView(type: .medium, text: "Kimetsu no Yaiba: Katanakaji no Sato-hen")
                        MediaCardView(type: .medium, text: "Jigokuraku")
                        MediaCardView(type: .medium, text: "[Oshi no Ko]")
                        MediaCardView(type: .medium, text: "Dr. STONE: NEW WORLD")
                        MediaCardView(type: .medium, text: "MASHLE")
                        MediaCardView(type: .medium, text: "Tengoku Daimakyou")
                    }
                    .padding([.horizontal, .bottom])
                }
            }
            top100
        }
    }
    
    var top100: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("Top 100 manga")
                    .font(.title)
                    .bold()

                Spacer()

                NavigationLink {
                    Text("Top 100")
                } label: {
                    Text("View all")
                }
            }
            .padding([.top, .horizontal])
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(1...10, id: \.self) { index in
                        ExploreMediaRowView(
                            model: MediaItemModel(
                                name: "Name",
                                state: .completed,
                                currentEpisode: 0,
                                totalEpisodes: 0,
                                userScore: 0,
                                startDate: Date(),
                                endDate: Date(),
                                rewatches: 0,
                                notes: "",
                                imageURLString: ""
                            ), 
                            index: index
                        )
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(viewModel: ExploreViewModel())
    }
}
