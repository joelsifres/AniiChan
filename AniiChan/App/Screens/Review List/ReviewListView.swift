//
//  ReviewListView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 18/6/23.
//

import SwiftUI

struct ReviewListView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16) {
                ReviewCondensedView()
                ReviewCondensedView()
                ReviewCondensedView()
                ReviewCondensedView()
                ReviewCondensedView()
                ReviewCondensedView()
                ReviewCondensedView()
            }
            .padding()
        }
        .navigationTitle("Reviews")
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReviewListView()
        }
    }
}
