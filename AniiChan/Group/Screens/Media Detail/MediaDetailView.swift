//
//  MediaDetailView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 16/6/23.
//

import SwiftUI
import YouTubePlayerKit

struct MediaDetailView: View {
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    @ObservedObject var viewModel: MediaDetailViewModel
    @State private var imageSize = CGSize()
    @State var isSynopsisExpanded: Bool = false
    @State var showToolBar = false
    @State var isPresented = false
    
    let youTubePlayer: YouTubePlayer = "https://www.youtube.com/watch?v=OfSaJb5OOPA"
    
    // MARK: Body
    var body: some View {
        OffsettableScrollView { offset in
            if imageSize.height > 0 {
                showToolBar = offset.y < -imageSize.height
            }
        } content: {
            LazyVStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Spacer()
                        .frame(height: imageSize.height)
                    headerContent
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.clear, .clear, Color(UIColor.systemBackground)]), startPoint: .top, endPoint: .bottom)
                )
                
                VStack(alignment: .leading, spacing: 0) {
                    synopsis
                    information
                    tags
                    relations
                    characters
                    staff
                    trailer
                    externalLinks
                    reviews
                    recommendations
                }
                .background(Color.systemBackground)
            }
            .padding(.bottom, 16)
        }
        .background {
            VStack {
                headerImage
                    .scaledToFit()
                Spacer()
            }
        }
        .coordinateSpace(name: CoordinateSpaces.scrollView)
        .edgesIgnoringSafeArea(.top)
        .navigationTitle(showToolBar ? "3-Gatsu no Lion 2" : "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(showToolBar ? .visible : .hidden, for: .navigationBar)
        .toolbar(showToolBar ? .visible : .hidden)
        .toolbar {
            Button {
                
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            Button {
                self.isPresented.toggle()
            } label: {
                Image(systemName: "square.and.pencil")
            }
        }
        .sheet(isPresented: $isPresented) {
            ListEntryEditorView(viewModel: ListEntryEditorViewModel())
        }
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
                        LinearGradient(gradient: Gradient(colors: [.clear, .clear, .clear, Color(UIColor.systemBackground)]), startPoint: .top, endPoint: .bottom)
                    )
                    .readSize { imageSize in
                        self.imageSize = imageSize
                    }
            case .failure, .empty:
                Spacer()
                    .readSize { _ in
                        self.imageSize = CGSize(width: 700, height: 400)
                    }
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
                MediaStateView(state: $viewModel.model.state)
                
                MediaProgressView(progress: $viewModel.model.currentEpisode, totalProgress: viewModel.model.totalEpisodes)
            }
            
            HStack {
                Button {
                    // Highest Ranked
                } label: {
                    Image(systemName: "star.fill")
                    
                    Text("Ranked #7")
                }
                .background(Material.ultraThin)
                .controlSize(.small)
                .buttonStyle(.bordered)
                .foregroundColor(.yellow)
                .cornerRadius(15)
                
                Button {
                    // Most Liked
                } label: {
                    Image(systemName: "heart.fill")
                    
                    Text("Ranked #340")
                }
                .background(Material.ultraThin)
                .buttonStyle(.bordered)
                .controlSize(.small)
                .foregroundColor(.pink)
                .cornerRadius(15)
            }
            .padding([.horizontal, .bottom])
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
    }
    
    // MARK: Information
    var information: some View {
        VStack(alignment: .leading) {
            Text("Information")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
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
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .padding(.bottom)
        }
    }
    
    // MARK: Tags
    var tags: some View {
        VStack(alignment: .leading) {
            Text("Tags")
                .font(.title)
                .bold()
            
            TagContainerView(tags: viewModel.model.tags)
        }
        .padding()
    }
    
    // MARK: Relations
    var relations: some View {
        VStack(alignment: .leading) {
            Text("Relations")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 16) {
                    MediaCardView(type: .medium, text: "3-gatsu no Lion")
                    MediaCardView(type: .medium, text: "3-gatsu no Lion")
                    MediaCardView(type: .medium, text: "3-gatsu no Lion Finale")
                    MediaCardView(type: .medium, text: "I AM STANDING")
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
    
    // MARK: Characters
    var characters: some View {
        VStack(alignment: .leading) {
            Text("Characters")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 16) {
                    MediaCardView(type: .small, text: "Rei Kiriyama")
                    MediaCardView(type: .small, text: "Hinata Kawamoto")
                    MediaCardView(type: .small, text: "Akari Kawamoto")
                    MediaCardView(type: .small, text: "Momo Kawamoto")
                    MediaCardView(type: .small, text: "Touji Souya")
                    MediaCardView(type: .small, text: "Masachika Kouda")
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
    
    // MARK: Staff
    var staff: some View {
        VStack(alignment: .leading) {
            Text("Staff")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    MediaCardView(type: .small, text: "Chica Umino")
                    MediaCardView(type: .small, text: "Akiyuki Shinbou")
                    MediaCardView(type: .small, text: "Kenjirou Okada")
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
    
    var trailer: some View {
        VStack(alignment: .leading) {
            Text("Trailer")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
            YouTubePlayerView(self.youTubePlayer) { state in
                switch state {
                case .idle:
                    ProgressView()
                case .ready:
                    EmptyView()
                case .error(let error):
                    Text(error.localizedDescription)
                }
            }
            .frame(height: imageSize.width * 9 / 16)
            .padding(.bottom)
        }
    }
    
    // MARK: External Links
    var externalLinks: some View {
        VStack(alignment: .leading) {
            Text("External links")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
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
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
    
    // MARK: Reviews
    var reviews: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("Reviews")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    ReviewListView()
                } label: {
                    Text("More reviews")
                }
            }
            
            VStack(spacing: 16) {
                ReviewCondensedView()
                ReviewCondensedView()
                ReviewCondensedView()
            }
        }
        .padding()
    }
    
    // MARK: Recommendations
    var recommendations: some View {
        VStack(alignment: .leading) {
            Text("Recommendations")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 16) {
                    MediaCardView(type: .medium, text: "Koe no Katachi")
                    MediaCardView(type: .medium, text: "Shigatsu wa Kimi no Uso")
                    MediaCardView(type: .medium, text: "Chihayafuru")
                    MediaCardView(type: .medium, text: "Ping Pong THE ANIMATION")
                    MediaCardView(type: .medium, text: "Fruits Basket 1st Season")
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MediaDetailView(viewModel: MediaDetailViewModel())
        }
    }
}
