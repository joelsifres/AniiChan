//
//  MediaCardView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 18/6/23.
//

import SwiftUI

struct MediaCardView: View {
    
    enum CardType {
        case small
        case medium
        case large
        
        var size: Double {
            switch self {
            case .small:
                return 80
            case .medium:
                return 200
            case .large:
                return 300
            }
        }
        
        var cgSize: CGSize {
            switch self {
            case .small:
                return CGSize(width: self.size * 0.71, height: self.size)
            case .medium:
                return CGSize(width: self.size * 0.71, height: self.size)
            case .large:
                return CGSize(width: self.size * 0.71, height: self.size)
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
    
    var type: CardType
    
    let text: String
    
    var body: some View {
        Button {
            // TBD
        } label: {
            switch type {
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
                        .frame(width: type.cgSize.width, height: type.cgSize.height)
                case .failure, .empty:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .clipped()
            
            VStack(alignment: .leading) {
                Text(text)
                    .font(.body)
                    .lineLimit(2, reservesSpace: true)
                
                Spacer()
                
                Text("Director")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(type.padding)
        }
        .background(Color.secondarySystemBackground)
        .frame(maxWidth: type.cgSize.width * 4)
        .cornerRadius(5)
    }
    
    // MARK: Medium Size
    private var mediumSizeCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            AsyncImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(width: type.cgSize.width, height: type.cgSize.height)
                case .failure, .empty:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .clipped()
            
            VStack(alignment: .leading) {
                Text("Source")
                    .font(.caption)
                    .foregroundColor(.blue)
                
                Text(text)
                    .lineLimit(3, reservesSpace: true)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Manga · Releasing")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .padding(type.padding)
        }
        .background(Color.systemGroupedBackground)
        .cornerRadius(5)
        .frame(width: type.cgSize.width)
        .frame(maxHeight: .infinity)
    }
}

struct MediaCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                MediaCardView(type: .small, text: "Rei Kiriyama")
                ScrollView(.horizontal) {
                    HStack {
                        MediaCardView(type: .medium, text: "3-Gatsu no Lion")
                        MediaCardView(type: .medium, text: "Neon Genesis Evangelion")
                    }
                    .padding()
                }
            }
        }
    }
}
