//
//  ListEntryEditorView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 23/6/23.
//

import SwiftUI
import Observation

struct ListEntryEditorView: View {
    
    @Bindable var viewModel: ListEntryEditorViewModel
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Status")
                    
                    Spacer()
                    
                    MediaStateView(state: $viewModel.entry.state)
                }
                
                HStack {
                    Text("Score")
                    
                    Spacer()
                    
                    RatingStarView(viewModel: RatingStarViewModel(rating: 3.5))
                }
                
                HStack {
                    MediaProgressView(progress: $viewModel.entry.currentEpisode, totalProgress: viewModel.entry.totalEpisodes)
                }
                
                DatePicker("Start Date", selection: $viewModel.entry.startDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                
                DatePicker("Finish Date", selection: $viewModel.entry.endDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                HStack {
                    Text("Total Rewatches")
                    
                    Spacer()
                    
                    Button {
                        viewModel.entry.rewatches -= 1
                    } label: {
                        Image(systemName: "minus")
                    }
                    
                    Text("\(viewModel.entry.rewatches)")
                    
                    Button {
                        viewModel.entry.rewatches += 1
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Notes")
                    
                    TextEditor(text: $viewModel.entry.notes)
                        .padding(4)
                        .frame(height: 200)
                        .border(Color.systemGroupedBackground)
                        .cornerRadius(5)
                }
            }
            .buttonStyle(.plain)
            .navigationTitle(viewModel.entry.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                }
                .tint(.red)
            }
        }
    }
}

struct ListEntryEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ListEntryEditorView(viewModel: ListEntryEditorViewModel())
    }
}
