//
//  MediaCardView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 18/6/23.
//

import SwiftUI

struct MediaCardView: View {
    
    enum CardSize: Double {
        case small = 80
        case medium = 200
        case large = 300
        
        var cgSize: CGSize {
            switch self {
            case .small:
                return CGSize(width: rawValue * 0.71, height: rawValue)
            case .medium:
                return CGSize(width: rawValue * 0.71, height: rawValue)
            case .large:
                return CGSize(width: rawValue * 0.71, height: rawValue)
            }
        }
        
        var padding: Double {
            switch self {
            case .small:
                return 8
            case .medium:
                return 8
            case .large:
                return 12
            }
        }
    }
    
    var size: CardSize
    
    var body: some View {
        Button {
            // TBD
        } label: {
            switch size {
            case .small:
                smallSizeCard
            case .medium:
                mediumSizeCard
            case .large:
                Text("TBD") // Maybe we don't need this
            }
        }
        .buttonStyle(.plain)
    }
}

extension MediaCardView {
    
    // MARK: Small Size
    private var smallSizeCard: some View {
        HStack(spacing: 0) {
            AsyncImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: size.cgSize.width, height: size.cgSize.height)
                case .failure, .empty:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text("Director")
                    .font(.body)
                
                Spacer()
                
                Text("Akiyuki Shinbou")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            .frame(maxWidth: .infinity)
            .padding(size.padding)
        }
        .background(Color.secondarySystemBackground)
        .frame(maxWidth: size.cgSize.width * 4)
        .cornerRadius(5)
    }
    
    // MARK: Medium Size
    private var mediumSizeCard: some View {
        ZStack {
            AsyncImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.clear, Color(UIColor.systemBackground)]), startPoint: .top, endPoint: .bottom)
                        )
                case .failure, .empty:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(5)
            
            VStack(alignment: .leading) {
                
                Spacer()
                Text("Source")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Text("3-gatsu no Lion")
                    .lineLimit(3)
                
                Text("Manga · Releasing")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, size.padding / 2)
            .padding(.horizontal, size.padding)
        }
        .frame(width: size.cgSize.width, height: size.cgSize.height)
        .cornerRadius(5)
    }
}

struct MediaCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                MediaCardView(size: .small)
                MediaCardView(size: .medium)
                MediaCardView(size: .large)
            }
        }
    }
}
