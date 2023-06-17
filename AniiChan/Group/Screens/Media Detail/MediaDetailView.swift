//
//  MediaDetailView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 16/6/23.
//

import SwiftUI

struct MediaDetailView: View {
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    @ObservedObject var viewModel: MediaDetailViewModel
    @State var isSynopsisExpanded: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack {
                        headerImage
                        VStack {
                            Spacer()
                            
                            Text("3-Gatsu no Lion 2")
                                .bold()
                                .foregroundColor(Color(UIColor.label))
                            
                            HStack {
                                Menu {
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "eye.fill")
                                        Text("Watching")
                                    }
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "checkmark.circle.fill")
                                        Text("Completed")
                                    }
                                    
                                    Button {
                                    } label: {
                                        Image(systemName: "timer.circle.fill")
                                        Text("On-Hold")
                                    }
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "eye.slash.fill")
                                        Text("Dropped")
                                    }
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "list.bullet.circle.fill")
                                        Text("Plan to Watch")
                                    }
                                } label: {
                                    Image(systemName: "eye.fill")
                                    Text("Watching")
                                }
//                                .buttonStyle(.borderedProminent)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(Material.ultraThin)
                                .cornerRadius(4)

                                Picker("Episodes", selection: $viewModel.currentEpisode) {
                                    ForEach(0...13, id: \.self) {
                                        Text("\($0)")
                                    }
                                }
                                .pickerStyle(.menu)
                                Text("/13")
                                
                                Button {
                                    $viewModel.currentEpisode.wrappedValue += 1
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                }
                            }
                        }
                        .padding()
                        .padding([.bottom], 20)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Synopsis")
                        .font(.headline)
                    Text(
                    """
                    The second season of 3-gatsu no Lion.
                    
                    Now in his second year of high school, Rei Kiriyama continues pushing through his struggles in the professional shogi world as well as his personal life. Surrounded by vibrant personalities at the shogi hall, the school club, and in the local community, his solitary shell slowly begins to crack. Among them are the three Kawamoto sisters—Akari, Hinata, and Momo—who forge an affectionate and familial bond with Rei. Through these ties, he realizes that everyone is burdened by their own emotional hardships and begins learning how to rely on others while supporting them in return.
                    
                    Nonetheless, the life of a professional is not easy. Between tournaments, championships, and title matches, the pressure mounts as Rei advances through the ranks and encounters incredibly skilled opponents. As he manages his relationships with those who have grown close to him, the shogi player continues to search for the reason he plays the game that defines his career.
                    """
                    )
                    .lineLimit(isSynopsisExpanded ? nil : 4)
                    Button {
                        isSynopsisExpanded.toggle()
                    } label: {
                        Text(isSynopsisExpanded ? "Read less" : "Read more")
                    }
                }
                .padding()
                .background(Color.red)
            }
            .coordinateSpace(name: CoordinateSpaces.scrollView)
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Neon Genesis Evangelion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden)
        }
    }
    
    var headerImage: some View {
        AsyncImage(
            url: URL(string: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx98478-dF3mpSKiZkQu.jpg")!
        ) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .overlay(
                        LinearGradient(gradient: Gradient(colors: [.clear, Color(UIColor.systemBackground)]), startPoint: .top, endPoint: .bottom)
                    )
            case .failure, .empty:
                EmptyView()
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(viewModel: MediaDetailViewModel())
    }
}
