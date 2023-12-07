//
//  ExploreViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 24/6/23.
//

import Foundation
import Observation

enum ExplorePage {
    case anime
    case manga
}

enum SearchScope: String, CaseIterable {
    case all
    case anime
    case manga
    case characters
    case staff
}

@Observable final class ExploreViewModel {
    var searchWord: String = ""
    var selectedPage: ExplorePage = .anime
    var searchScope: SearchScope = .all
}
