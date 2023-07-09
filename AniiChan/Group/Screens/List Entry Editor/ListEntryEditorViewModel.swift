//
//  ListEntryEditorViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 26/6/23.
//

import Foundation
import Observation

@Observable final class ListEntryEditorViewModel {
    var entry: MediaItemModel = MediaItemModel(name: "Neon Genesis Evangelion",
                                               state: .planToWatch,
                                               currentEpisode: 0,
                                               totalEpisodes: 24,
                                               startDate: Date(),
                                               endDate: Date(),
                                               rewatches: 0,
                                               notes: "Looks promising",
                                               imageURLString: "")
}
