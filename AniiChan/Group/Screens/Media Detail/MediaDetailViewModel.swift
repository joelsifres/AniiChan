//
//  MediaDetailViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 16/6/23.
//

import Foundation

final class MediaDetailViewModel: ObservableObject {
    
    @Published var model: MediaItemModel = MediaItemModel(
        name: "3-Gatsu no Lion 2",
        state: .watching,
        currentEpisode: 4,
        totalEpisodes: 22,
        imageURLString: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg"
    )
}
