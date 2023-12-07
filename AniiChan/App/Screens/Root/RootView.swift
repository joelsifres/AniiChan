//
//  RootView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 7/12/23.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    
    @Bindable var store: StoreOf<Root>
    
    var body: some View {
        TabView(selection: $store.selectedTab.sending(\.tabSelected)) {
            MediaListView(
                store: store.scope(
                    state: \.userMediaListState,
                    action: \.userMediaList
                )
            )
            .tabItem {
                Label("Your List", systemImage: "list.bullet")
            }
            .tag(Root.Tab.list)
            
            ExploreView(viewModel: ExploreViewModel())
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                .tag(Root.Tab.explore)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(Root.Tab.profile)

        }
    }
}

#Preview {
    RootView(
        store: Store(
            initialState: Root.State()
        ) {
            Root()
        }
    )
}
