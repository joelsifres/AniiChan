//
//  ExploreMediaRowView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 25/6/23.
//

import SwiftUI

struct ExploreMediaRowView: View {
    
    let model: MediaListItemModel
    let index: Int
    
    var indexColor: Color {
        switch index {
        case 1:
            return .yellow
        case 2:
            return .gray
        case 3:
            return .brown
        default:
            return Color.label
        }
    }
    
    var body: some View {
        HStack {
            Text("#\(index)")
                .bold(index < 4)
                .foregroundColor(indexColor)
            
            ZStack(alignment: .topTrailing) {
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
                
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 12)
                    .padding(4)
                    .shadow(radius: 2)
            }
            
            VStack(alignment: .leading) {
                Text(model.name)
                    .bold()
                
                TagContainerView(
                    tags: [
                        Tag(
                            text: "action",
                            onTap: {}
                        ),
                        Tag(
                            text: "drama",
                            onTap: {}
                        ),
                        Tag(
                            text: "psychological",
                            onTap: {}
                        ),
                        Tag(
                            text: "seinen",
                            onTap: {}
                        ),
                        Tag(
                            text: "slice of life",
                            onTap: {}
                        ),
                        Tag(
                            text: "school",
                            onTap: {}
                        ),
                    ],
                    type: .horizontal
                )
            }
        }
        .padding(8)
    }
}

struct ExploreMediaRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreMediaRowView(model: MediaListItemModel(name: "Name", state: .completed, currentEpisode: 0, totalEpisodes: 0, score: 0), index: 1)
            .previewLayout(.fixed(width: 400, height: 150))
    }
}
