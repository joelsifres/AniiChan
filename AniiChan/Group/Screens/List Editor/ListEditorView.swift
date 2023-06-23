//
//  ListEditorView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 23/6/23.
//

import SwiftUI

struct ListEditorView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Status")
                    
                    Spacer()
                    
                    MediaStateView(state: .constant(.completed))
                }
                
                HStack {
                    Text("Score")
                    
                    Spacer()
                    
                    RatingStarView(viewModel: RatingStarViewModel(rating: 3.5))
                }
                
                HStack {
                    MediaProgressView(progress: .constant(8), totalProgress: 12)
                }
                
                DatePicker("Start Date", selection: .constant(Date()), displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                
                DatePicker("Finish Date", selection: .constant(Date()), displayedComponents: .date)
                    .datePickerStyle(.compact)
                
                HStack {
                    Text("Total Rewatches")
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "minus")
                    }
                    
                    Text("0")
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Notes")
                    
                    TextEditor(text: .constant("Asdfasdfasdfas"))
                        .padding(4)
                        .frame(height: 200)
                        .border(Color.systemGroupedBackground)
                        .cornerRadius(5)
                }
            }
            .navigationTitle("3-gatsu no Lion 2")
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

struct ListEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ListEditorView()
    }
}
