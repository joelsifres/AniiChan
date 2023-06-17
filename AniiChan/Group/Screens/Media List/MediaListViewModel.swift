//
//  MediaListViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import Foundation

enum MediaListPickerSelection: Int {
    case anime = 0
    case manga = 1
}

final class MediaListViewModel: ObservableObject {

    enum SortingFilter {
        case title
        case score
        case progress
        case lastUpdated
        case lastAdded
        case releaseDate
    }

    @Published var pickerSelection: MediaListPickerSelection
    @Published var userAnimeList: [MediaListItemModel]
    var userMangaList: [MediaListItemModel]
    
    init(pickerSelection: MediaListPickerSelection = .anime,
         userAnimeLists: [MediaListItemModel],
         userMangaList: [MediaListItemModel]) {
        self.pickerSelection = pickerSelection
        self.userAnimeList = userAnimeLists
        self.userMangaList = userMangaList
    }

    func sort(by filter: SortingFilter) {
        switch filter {
        case .title:
            userAnimeList.sort { item1, item2 in
                item1.name < item2.name
            }
        case .score:
            break
        case .progress:
            break
        case .lastUpdated:
            break
        case .lastAdded:
            break
        case .releaseDate:
            break
        }
    }
}
