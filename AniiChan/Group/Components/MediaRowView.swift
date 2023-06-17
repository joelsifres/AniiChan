//
//  MediaRowView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import SwiftUI

struct MediaRowView: View {
    @Binding var model: MediaListItemModel

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/user/avatar/large/b47276-HVV4cFqvS7fm.jpg"), scale: 2)
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(model.name)
                    .font(.headline)
                    .lineLimit(1)

                HStack(spacing: 16) {
                    Text("Episodes: \(model.currentEpisode)/\(model.totalEpisodes)")

                    HStack(spacing: 2) {
                        Text("4.5")

                        Image(systemName: "star.fill")
                    }

                }
                .foregroundColor(.gray)
                .font(.subheadline)
            }
        }
    }
}

struct MediaRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        List {
            MediaRowView(
                model: .constant(
                    MediaListItemModel(
                        name: "Name",
                        state: .watching,
                        currentEpisode: 1,
                        totalEpisodes: 12
                    )
                )
            )
        }
    }
}
