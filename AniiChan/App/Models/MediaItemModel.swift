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
    var state: MediaState
    var currentEpisode: Int
    var totalEpisodes: Int
    var startDate: Date
    var endDate: Date
    var rewatches: Int
    var notes: String
    var tags: [Tag] = []
    
    var imageURLString: String
}

extension MediaItemModel: Equatable {
    static func == (lhs: MediaItemModel, rhs: MediaItemModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension MediaItemModel {
    static var mock: Self {
        MediaItemModel(
            name: "3-Gatsu no Lion 2",
            state: .inProgress,
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
}
