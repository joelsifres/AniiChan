//
//  ProfileView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 19/7/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    AsyncImage(
                        url: URL(string: "https://s4.anilist.co/file/anilistcdn/user/banner/b47276-fYNfVeJtKLSd.jpg")!
                    ) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [.clear, Color(UIColor.systemBackground)]), startPoint: .top, endPoint: .bottom)
                                    
                                )
                                .frame(height: 200)
                                .clipped()
                        case .failure, .empty:
                            EmptyView()
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    about
                    animeStats
                    mangaStats
                    favoriteAnime
                    favoriteManga
                }
            }
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Kipik's Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "gearshape.fill")
                }
            }
        }
    }
}

extension ProfileView {
    
    // MARK: Favorite Anime
    var about: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
            Text("""
                 26 | non-binary | queer | married to @esportsanime | occasional anime enjoyer
                 Follow me if you want to see posts talking about music or Drag Race.
                 Other
                 Discord: wheatsquares33
                 RateYourMusic
                 Husbando list
            """)
        }
    }
    
    var animeStats: some View {
        HStack {
            VStack {
                Text("1625")
                    .bold()
                    .foregroundStyle(TintShapeStyle())
                
                Text("Total Anime")
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text("1625")
                    .bold()
                    .foregroundStyle(TintShapeStyle())
                
                Text("Total Anime")
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text("1625")
                    .bold()
                    .foregroundStyle(TintShapeStyle())
                
                Text("Total Anime")
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.secondarySystemBackground)
        .cornerRadius(10)
        .padding()
    }
    
    var mangaStats: some View {
        HStack {
            VStack {
                Text("1625")
                    .bold()
                    .foregroundStyle(TintShapeStyle())
                
                Text("Total Manga")
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text("1625")
                    .bold()
                    .foregroundStyle(TintShapeStyle())
                
                Text("Total Manga")
                    .font(.caption)
            }
            
            Spacer()
            
            VStack {
                Text("1625")
                    .bold()
                    .foregroundStyle(TintShapeStyle())
                
                Text("Total Manga")
                    .font(.caption)
            }
        }
        .padding()
        .background(Color.secondarySystemBackground)
        .cornerRadius(10)
        .padding()
    }
    
    // MARK: Favorite Anime
    var favoriteAnime: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("Favorite Anime")
                    .font(.title)
                    .bold()
                    .padding([.top, .horizontal])
                
                Spacer()
                
                Button {
                    // Go to AnimeList
                } label: {
                    Image(systemName: "list.bullet")
                }
                .padding(.horizontal)
            }
            
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
    
    // MARK: Favorite Manga
    var favoriteManga: some View {
        VStack(alignment: .leading) {
            Text("Favorite Manga")
                .font(.title)
                .bold()
                .padding([.top, .horizontal])
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 16) {
                    MediaCardView(type: .medium, text: "Koe no Katachi")
                    MediaCardView(type: .medium, text: "Shigatsu wa Kimi no Uso")
                    MediaCardView(type: .medium, text: "Chihayafuru")
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ProfileView()
}
