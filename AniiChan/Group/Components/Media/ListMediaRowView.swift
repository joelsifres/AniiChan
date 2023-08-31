//
//  MediaRowView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI

struct ListMediaRowView: View {
    @Binding var model: MediaListItemModel

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/user/avatar/large/b47276-HVV4cFqvS7fm.jpg")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                case .failure:
                    Image(systemName: "photo")
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                @unknown default:
                    EmptyView()
                }
            }
            .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(model.name)
                    .font(.headline)
                    .lineLimit(1)
                
                ProgressView(value: Double(model.currentEpisode), total: Double(model.totalEpisodes))
                    .progressViewStyle(.linear)
                    .tint(color(for: model.state))
                
                HStack {
                    Text("Progress: \(model.currentEpisode)/\(model.totalEpisodes)")
                    
                    Spacer()
                    
                    if model.state != .planToWatch {
                        RatingView(score: model.score / 2)
                    }
                }
                .foregroundColor(.gray)
                .font(.subheadline)
            }
        }
    }
    
    private func color(for status: MediaListItemModel.MediaItemState) -> Color {
        switch status {
        case .watching:
            return .blue
        case .completed:
            return .green
        case .onHold:
            return .yellow
        case .dropped:
            return .red
        case .planToWatch:
            return .gray
        }
    }
}

struct RatingView: View {
    let score: Double
    
    var body: some View {
        HStack(spacing: 2) {
            Text(String(format: "%.1f", score))
            
            Image(systemName: "star.fill")
        }
    }
}

struct ListMediaRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            ListMediaRowView(
                model: .constant(
                    MediaListItemModel(
                        name: "Name",
                        state: .watching,
                        currentEpisode: 1,
                        totalEpisodes: 12,
                        score: 8
                    )
                )
            )
            
            ListMediaRowView(
                model: .constant(
                    MediaListItemModel(
                        name: "Name",
                        state: .completed,
                        currentEpisode: 12,
                        totalEpisodes: 12,
                        score: 8
                    )
                )
            )
            
            ListMediaRowView(
                model: .constant(
                    MediaListItemModel(
                        name: "Name",
                        state: .onHold,
                        currentEpisode: 4,
                        totalEpisodes: 12,
                        score: 8
                    )
                )
            )
            
            ListMediaRowView(
                model: .constant(
                    MediaListItemModel(
                        name: "Name",
                        state: .planToWatch,
                        currentEpisode: 0,
                        totalEpisodes: 12,
                        score: 8
                    )
                )
            )
            
            ListMediaRowView(
                model: .constant(
                    MediaListItemModel(
                        name: "Name",
                        state: .dropped,
                        currentEpisode: 4,
                        totalEpisodes: 12,
                        score: 8
                    )
                )
            )
        }
    }
}
