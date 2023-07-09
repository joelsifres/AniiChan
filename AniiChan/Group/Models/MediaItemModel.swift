//
//  MediaItemModel.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 16/6/23.
//

import Foundation

protocol IterableEnum: CaseIterable, Identifiable {
    var id: String { get }
    var stringValue: String { get }
}

struct MediaItemModel: Identifiable {
    enum AnimeMediaState: String, CaseIterable, Identifiable {
        case watching = "Watching"
        case completed = "Completed"
        case onHold = "On hold"
        case dropped = "Dropped"
        case planToWatch = "Plan to Watch"
        case addToList = "Add to List"
        
        var id: String {
            self.rawValue
        }
    }
    
    // Maybe if only the first is different we don't need two enums
    enum MangaMediaState: String, CaseIterable, Identifiable {
        case reading = "Watching"
        case completed = "Completed"
        case onHold = "On hold"
        case dropped = "Dropped"
        case planToWatch = "Plan to Watch"
        case addToList = "Add to List"
        
        var id: String {
            self.rawValue
        }
    }
    
    enum MediaType: String, CaseIterable, Identifiable {
        case anime = "Anime"
        case manga = "Manga"
        
        var id: String {
            self.rawValue
        }
    }
    
    enum AnimeMediaFormat: IterableEnum {
        case tv
        case movie
        case ova
        case ona
        case tvShort
        case special
        case music
        
        var id: String {
            return UUID().uuidString
        }
        
        var stringValue: String {
            switch self {
            case .tv: return "TV"
            case .movie: return "Movie"
            case .ova: return "OVA"
            case .ona: return "ONA"
            case .tvShort: return "TV Short"
            case .special: return "Special"
            case .music: return "Music"
            }
        }
    }
    
    enum MangaMediaFormat: IterableEnum {
        case manga
        case oneShot
        case lightNovel
        
        var id: String {
            return UUID().uuidString
        }
        
        var stringValue: String {
            switch self {
            case .manga: return "Manga"
            case .oneShot: return "One Shot"
            case .lightNovel: return "LightNovel"
            }
        }
    }
    
    let id = UUID()
    
    var name: String
    var state: AnimeMediaState
    var currentEpisode: Int
    var totalEpisodes: Int
    var startDate: Date
    var endDate: Date
    var rewatches: Int
    var notes: String
    var tags: [Tag] = []
    
    var imageURLString: String

    mutating func increaseCurrentEpisode() {
        guard state == .watching else { return }

        currentEpisode = currentEpisode + 1

        if currentEpisode == totalEpisodes {
            state = .completed
        }
    }
}
