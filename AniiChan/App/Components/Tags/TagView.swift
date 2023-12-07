//
//  TagView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 28/6/23.
//

import SwiftUI

struct TagView: View {
    
    let tag: Tag
    
    var body: some View {
        Button {
            tag.onTap()
        } label: {
            Text(tag.text)
        }
        .buttonStyle(.bordered)
        .controlSize(.mini)
        .font(.caption)
    }
}

#Preview {
    TagView(
        tag: Tag(
            text: "action",
            onTap: {}
        )
    )
}
