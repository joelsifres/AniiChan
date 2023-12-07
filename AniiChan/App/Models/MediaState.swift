//
//  MediaState.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 7/12/23.
//

import Foundation

enum MediaState: CaseIterable, Identifiable, Equatable {
    case inProgress
    case completed
    case onHold
    case dropped
    case planning
    case notInList
    
    var id: UUID {
        UUID()
    }
    
    func stringValue(for type: MediaType) -> String {
        switch type {
        case .anime:
            switch self {
            case .inProgress:
                return "Watching"
            case .completed:
                return "Completed"
            case .onHold:
                return "On hold"
            case .dropped:
                return "Dropped"
            case .planning:
                return "Plan to Watch"
            case .notInList:
                return ""
            }
            
        case .manga:
            switch self {
            case .inProgress:
                return "Reading"
            case .completed:
                return "Completed"
            case .onHold:
                return "On hold"
            case .dropped:
                return "Dropped"
            case .planning:
                return "Plan to Read"
            case .notInList:
                return ""
            }
        }
    }
}

enum MediaType: String, CaseIterable, Identifiable, Equatable {
    case anime = "Anime"
    case manga = "Manga"
    
    var id: String {
        self.rawValue
    }
}
