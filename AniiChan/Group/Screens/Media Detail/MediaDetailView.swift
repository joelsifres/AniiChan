//
//  MediaDetailView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 16/6/23.
//

import SwiftUI

struct MediaDetailView: View {
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    @ObservedObject var viewModel: MediaDetailViewModel
    @State private var imageSize = CGSize()
    @State var isSynopsisExpanded: Bool = false
    @State var showToolBar = false
    
    // MARK: Body
    var body: some View {
        OffsettableScrollView { offset in
            if imageSize.height > 0 {
                showToolBar = offset.y < -imageSize.height
            }
        } content: {
            LazyVStack(alignment: .leading, spacing: 0) {
                ZStack {
                    headerImage
                    headerContent
                }
                
                synopsis
                information
                relations
                staff
                characters
                externalLinks
                reviews
            }
            .padding(.bottom, 16)
        }
        .coordinateSpace(name: CoordinateSpaces.scrollView)
        .edgesIgnoringSafeArea(.top)
        .navigationTitle("3-Gatsu no Lion 2")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(showToolBar ? .visible : .hidden)
    }
}

extension MediaDetailView {
    
    // MARK: Header
    var headerImage: some View {
        AsyncImage(
            url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg")!
        ) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.clear, Color(UIColor.systemBackground)]), startPoint: .top, endPoint: .bottom)
                        
                    )
                    .readSize { imageSize in
                        self.imageSize = imageSize
                    }
            case .failure, .empty:
                EmptyView()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    var headerContent: some View {
        VStack {
            Spacer()
            
            Text("3-Gatsu no Lion 2")
                .bold()
                .foregroundColor(Color(UIColor.label))
            
            HStack {
                Menu {
                    ForEach(MediaItemModel.AnimeMediaState.allCases) { state in
                        Button {
                            viewModel.model.state = state
                        } label: {
                            Text(state.rawValue)
                        }
                    }
                } label: {
                    Text(viewModel.model.state.rawValue)
                    Image(systemName: "chevron.down")
                }
                .buttonStyle(.borderedProminent)
                
                HStack(spacing: 0) {
                    Picker("Episodes", selection: $viewModel.model.currentEpisode) {
                        ForEach(0...13, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Text("/ 13")
                }
            }
            
            HStack {
                Button {
                    // Highest Ranked
                } label: {
                    Image(systemName: "star.fill")
                    
                    Text("#7 Highest Rated")
                }
                .controlSize(.small)
                .buttonStyle(.bordered)
                .tint(.yellow)
                
                Button {
                    // Highest Ranked
                } label: {
                    Image(systemName: "heart.fill")
                    
                    Text(" #340 Most Popular")
                }
                .controlSize(.small)
                .buttonStyle(.bordered)
                .tint(.pink)
            }
        }
        .padding()
    }
    
    // MARK: Synopsis
    var synopsis: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Synopsis")
                .font(.title)
                .bold()
            
            Text(
                """
                The second season of 3-gatsu no Lion.
                
                Now in his second year of high school, Rei Kiriyama continues pushing through his struggles in the professional shogi world as well as his personal life. Surrounded by vibrant personalities at the shogi hall, the school club, and in the local community, his solitary shell slowly begins to crack. Among them are the three Kawamoto sisters—Akari, Hinata, and Momo—who forge an affectionate and familial bond with Rei. Through these ties, he realizes that everyone is burdened by their own emotional hardships and begins learning how to rely on others while supporting them in return.
                
                Nonetheless, the life of a professional is not easy. Between tournaments, championships, and title matches, the pressure mounts as Rei advances through the ranks and encounters incredibly skilled opponents. As he manages his relationships with those who have grown close to him, the shogi player continues to search for the reason he plays the game that defines his career.
                """
            )
            .lineLimit(isSynopsisExpanded ? nil : 5)
            
            Button {
                isSynopsisExpanded.toggle()
            } label: {
                Text(isSynopsisExpanded ? "Read less" : "Read more")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .previewBackground()
    }
    
    // MARK: Information
    var information: some View {
        VStack(alignment: .leading) {
            Text("Information")
                .font(.title)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 16) {
                    // ForEach
                    VStack(alignment: .leading) {
                        Text("Format")
                            .font(.headline)
                        
                        Text("TV")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Episodes")
                            .font(.headline)
                        
                        Text("22")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Episode Duration")
                            .font(.headline)
                        
                        Text("25 mins")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Status")
                            .font(.headline)
                        
                        Text("Finished")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Start Date")
                            .font(.headline)
                        
                        Text("Oct 14, 2017")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("End Date")
                            .font(.headline)
                        
                        Text("Mar 31, 2018")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Season")
                            .font(.headline)
                        
                        Text("Fall 2017")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Average Score")
                            .font(.headline)
                        
                        Text("89%")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Mean Score")
                            .font(.headline)
                        
                        Text("89%")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Genres")
                            .font(.headline)
                        
                        Text("Drama, Slice of Life")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
        .previewBackground()
    }
    
    // MARK: Relations
    var relations: some View {
        VStack(alignment: .leading) {
            Text("Relations")
                .font(.title)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    MediaCardView(size: .medium)
                    MediaCardView(size: .medium)
                    MediaCardView(size: .medium)
                }
            }
        }
        .padding()
    }
    
    // MARK: Staff
    var staff: some View {
        VStack(alignment: .leading) {
            Text("Staff")
                .font(.title)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    MediaCardView(size: .small)
                    MediaCardView(size: .small)
                    MediaCardView(size: .small)
                }
            }
        }
        .padding()
    }
    
    // MARK: Characters
    var characters: some View {
        VStack(alignment: .leading) {
            Text("Characters")
                .font(.title)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    MediaCardView(size: .small)
                    MediaCardView(size: .small)
                    MediaCardView(size: .small)
                }
            }
        }
        .padding()
    }
    
    // MARK: External Links
    var externalLinks: some View {
        VStack(alignment: .leading) {
            Text("External links")
                .font(.title)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 16) {
                    // ForEach
                    Button {
                        
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "link")
                            
                            Text("Official Site")
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "link")
                            
                            Text("Twitter")
                        }
                    }
                    Button {
                        
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "link")
                            
                            Text("Crunchyrroll")
                        }
                    }
                    Button {
                        
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "link")
                            
                            Text("Funimation")
                        }
                    }
                    Button {
                        
                    } label: {
                        HStack(alignment: .center) {
                            Image(systemName: "link")
                            
                            Text("Netflix")
                        }
                    }
                }
            }
        }
        .padding()
        .previewBackground()
    }
    
    // MARK: Reviews
    var reviews: some View {
        VStack(alignment: .leading) {
            Text("Reviews")
                .font(.title)
                .bold()
            
            VStack(spacing: 16) {
                ReviewCondensedView()
                ReviewCondensedView()
                ReviewCondensedView()
            }
            
            HStack {
                Spacer()
                
                NavigationLink {
                    ReviewListView()
                } label: {
                    Text("More reviews")
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding()
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MediaDetailView(viewModel: MediaDetailViewModel())
        }
    }
}
