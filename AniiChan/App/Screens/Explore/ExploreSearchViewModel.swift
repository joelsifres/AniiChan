//
//  ExploreSearchViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 29/6/23.
//

import Foundation
import Observation

@Observable final class ExploreSearchViewModel {
    var searchWord: String = ""
    var searchScope: SearchScope = .all
    
    var allMedia: [MediaItemModel] = [
    ]
    
    var searchResults: [MediaItemModel] = []
}
