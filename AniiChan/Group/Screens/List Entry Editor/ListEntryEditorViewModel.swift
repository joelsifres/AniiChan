//
//  ListEntryEditorViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 26/6/23.
//

import Foundation
import Observation

final class ListEntryEditorViewModel: ObservableObject {
    var entry: MediaItemModel = MediaItemModel(name: "Neon Genesis Evangelion",
                                               state: .planning,
                                               currentEpisode: 0,
                                               totalEpisodes: 24,
                                               startDate: Date(),
                                               endDate: Date(),
                                               rewatches: 0,
                                               notes: "Looks promising",
                                               imageURLString: "")
}
