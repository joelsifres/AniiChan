//
//  AsyncMediaImage.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 26/6/23.
//

import SwiftUI

struct AsyncMediaImage: View {
    let url: URL?
    let size: CGSize
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: size.width, height: size.height)
            case .failure:
                Image(systemName: "photo")
                    .frame(width: size.width, height: size.height)
                    .foregroundColor(.gray)
                    .background(Color.systemGray5)
            case .empty:
                ProgressView()
                    .frame(width: size.width, height: size.height)
                    .background(Color.systemGray5)
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct AsyncMediaImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncMediaImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg"), size: CGSize(width: 200, height: 400))
    }
}
