//
//  TagContainerView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 28/6/23.
//

import SwiftUI

struct Tag: Identifiable {
    
    let id = UUID()
    let text: String
    let onTap: () -> Void
}

struct TagContainerView: View {
    
    enum ContainerType {
        case flow
        case horizontal
    }
    
    var tags: [Tag]
    var type: ContainerType = .flow
    
    var body: some View {
        switch type {
        case .flow:
            FlowLayout(alignment: .leading) {
                tagsView
            }
        case .horizontal:
            ScrollView(.horizontal) {
                LazyHStack {
                    tagsView
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
    }
}

extension TagContainerView {
    var tagsView: some View {
        ForEach(tags) { tag in
            TagView(tag: tag)
        }
    }
}

#Preview {
    TagContainerView(
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
            )
        ]
    )
}
