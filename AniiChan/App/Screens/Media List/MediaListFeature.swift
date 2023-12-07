//
//  MediaListFeature.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 6/12/23.
//

import Foundation
import ComposableArchitecture

protocol Filter: Identifiable, CaseIterable, Equatable {
    var id: String { get }
    var stringValue: String { get }
}

enum SortingFilter: Filter, Equatable {
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

enum SortingFilterOrder: Equatable {
    case ascending
    case descending
}

@Reducer
struct MediaList {
    
    
//    @Reducer
//    struct Path {
//        
//        @ObservableState
//        enum State {
//            case detailItem(MediaDetail.State)
//        }
//        
//        enum Action {
//            case detailItem(MediaDetail.Action)
//        }
//        
//        var body: some ReducerOf<Self> {
//            Scope(state: \.detailItem, action: \.detailItem) {
//                MediaDetail()
//            }
//        }
//    }
    
    @Dependency(\.mainQueue) var mainQueue
    
    @ObservableState
    struct State {
        var path: StackState<MediaDetail.State> = .init()
        
        var selectedPage: MediaType = .anime
        var visibleMedia: IdentifiedArrayOf<MediaItemModel> = []
        var currentSortingFilter: any Filter = SortingFilter.state
        var currentSortingFilterOrder: SortingFilterOrder = .descending
        
        var searchWord: String = ""
        
        var userAnimeList: IdentifiedArrayOf<MediaItemModel> = []
        var userMangaList: IdentifiedArrayOf<MediaItemModel> = []
        
        var debounceDuration: DispatchQueue.SchedulerTimeType.Stride = 0.3
    }
    
    enum Action {
        case path(StackAction<MediaDetail.State, MediaDetail.Action>)
        case onSearchWordChanged(String)
        case debounceSearchList(String)
        case setSelectedPage(MediaType)
        case sort(SortingFilter)
        case toggleOrder
        case onIncreaseCurrentEpisode(MediaItemModel)
    }
    
    private enum CancelID {
        case debounceRequest
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path(_):
                return .none
                
            case .onSearchWordChanged(let newWord):
                state.searchWord = newWord
                
                return .send(.debounceSearchList(newWord))
                    .debounce(
                        id: CancelID.debounceRequest,
                        for: state.debounceDuration,
                        scheduler: mainQueue
                    )
                
            case .debounceSearchList(let newWord):
                if newWord.isEmpty {
                    switch state.selectedPage {
                    case .anime:
                        state.visibleMedia = state.userAnimeList
                        
                    case .manga:
                        state.visibleMedia = state.userMangaList
                    }
                } else {
                    switch state.selectedPage {
                    case .anime:
                        state.visibleMedia = state.userAnimeList.filter { $0.name.lowercased().contains(newWord.lowercased()) }
                        
                    case .manga:
                        state.visibleMedia = state.userMangaList.filter { $0.name.lowercased().contains(newWord.lowercased()) }
                    }
                }
                
                return .none
                
            case .setSelectedPage(let newPage):
                state.selectedPage = newPage
                
                switch newPage {
                case .anime:
                    state.visibleMedia = state.userAnimeList
                case .manga:
                    state.visibleMedia = state.userMangaList
                }
                
                return .none
                
            case .sort(let filter):
                var list = state.visibleMedia
                state.currentSortingFilter = filter
                
                switch filter {
                case .state:
                    list.sort { item1, item2 in
                        item1.state.hashValue < item2.state.hashValue
                    }
                    
                case .title:
                    list.sort { item1, item2 in
                        item1.name < item2.name
                    }
                    
                case .score:
                    list.sort { item1, item2 in
                        item1.userScore > item2.userScore
                    }
                    
                case .progress:
                    list.sort { item1, item2 in
                        item1.currentEpisode > item2.currentEpisode
                    }
                    
                case .lastUpdated:
                    list.sort { item1, item2 in
                        item1.lastUpdated > item2.lastUpdated
                    }
                    
                case .lastAdded:
                    list.sort { item1, item2 in
                        item1.lastAdded > item2.lastAdded
                    }
                    
                case .releaseDate:
                    list.sort { item1, item2 in
                        item1.releaseDate > item2.releaseDate
                    }
                }
                
                state.visibleMedia = list
                return .none
                
            case .toggleOrder:
                state.currentSortingFilterOrder = state.currentSortingFilterOrder == .ascending ? .descending : .ascending
                state.visibleMedia.reverse()
                return .none
                
            case .onIncreaseCurrentEpisode(let model):
                guard model.state == .inProgress else { return .none }
                
                var newModel = model
                newModel.currentEpisode += 1
                
                if newModel.currentEpisode == newModel.totalEpisodes {
                    // TODO: Popup asking user if they want to update the state to completed?
                    newModel.state = .completed
                }
                
                state.visibleMedia[id: model.id]?.currentEpisode = newModel.currentEpisode
                state.visibleMedia[id: model.id]?.state = newModel.state
                
                switch state.selectedPage {
                case .anime:
                    state.userAnimeList[id: model.id] = newModel
                    
                case .manga:
                    state.userMangaList[id: model.id] = newModel
                }
                
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            MediaDetail()
        }
    }
}
