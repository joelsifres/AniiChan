//
//  MediaListViewModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 15/6/23.
//

import Foundation
import Observation

enum MediaPage {
    case anime
    case manga
}

protocol Filter: Identifiable, CaseIterable {
    var id: String { get }
    var stringValue: String { get }
}

@Observable final class MediaListViewModel {

    enum SortingFilter: Filter {
        case state
        case title
        case score
        case progress
        case lastUpdated
        case lastAdded
        case releaseDate
        
        var id: String {
            return self.stringValue
        }
        
        var stringValue: String {
            switch self {
            case .state:
                return "State"
            case .title:
                return "Title"
            case .score:
                return "Score"
            case .progress:
                return "Progress"
            case .lastUpdated:
                return "Last Updated"
            case .lastAdded:
                return "Last Added"
            case .releaseDate:
                return "Release Date"
            }
        }
    }
    
    enum SortingFilterOrder {
        case ascending
        case descending
    }
    
    var selectedPage: MediaPage = .anime
    var selectedList: [MediaListItemModel] = []
    var currentSortingFilter: any Filter = SortingFilter.state
    var currentSortingFilterOrder: SortingFilterOrder = .descending
    
    var searchWord: String = ""
    
    @ObservationIgnored var userAnimeList: [MediaListItemModel] = []
    @ObservationIgnored var userMangaList: [MediaListItemModel] = []
    
    init(selectedPage: MediaPage = .anime,
         userAnimeLists: [MediaListItemModel],
         userMangaList: [MediaListItemModel]) {
        self.userAnimeList = userAnimeLists
        self.userMangaList = userMangaList
        self.setSelectedPage(to: selectedPage)
    }
    
    func setSelectedPage(to page: MediaPage) {
        selectedPage = page
        switch page {
        case .anime:
            selectedList = userAnimeList
        case .manga:
            selectedList = userMangaList
        }
    }

    func sort(by filter: SortingFilter) {
        currentSortingFilter = filter
        var list = selectedList
        
        switch filter {
        case .state:
            list.sort { item1, item2 in
                item1.state.rawValue < item2.state.rawValue
            }
        case .title:
            list.sort { item1, item2 in
                item1.name < item2.name
            }
        case .score:
            list.sort { item1, item2 in
                item1.score > item2.score
            }
        case .progress:
            list.sort { item1, item2 in
                item1.currentEpisode > item2.currentEpisode
            }
        case .lastUpdated:
            break
        case .lastAdded:
            break
        case .releaseDate:
            break
        }
        
        selectedList = list
    }
    
    func toggleOrder() {
        currentSortingFilterOrder = currentSortingFilterOrder == .ascending ? .descending : .ascending
        selectedList.reverse()
    }
}
