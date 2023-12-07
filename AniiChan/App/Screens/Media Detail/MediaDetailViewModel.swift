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
        startDate: Date(),
        endDate: Date(),
        rewatches: 0,
        notes: "",
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
        imageURLString: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg"
    )
}
