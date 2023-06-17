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
    
    private enum Constants: Double {
        case toolBarHeightOffset = 148
    }
    
    @ObservedObject var viewModel: MediaDetailViewModel
    @State private var imageSize = CGSize()
    @State var isSynopsisExpanded: Bool = false
    @State var showToolBar = false
    
    var body: some View {
        OffsettableScrollView { offset in
                if imageSize.height > 0 {
                    showToolBar = offset.y < -imageSize.height + Constants.toolBarHeightOffset.rawValue
                }
            print("Offset: \(offset.y)")
            print("Image size: \(imageSize.height)")
        } content: {
            LazyVStack(alignment: .leading, spacing: 0) {
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
                                    Text("Watching")
                                }
                                Button {
                                    
                                } label: {
                                    Text("Completed")
                                }
                                
                                Button {
                                } label: {
                                    Text("On-Hold")
                                }
                                Button {
                                    
                                } label: {
                                    Text("Dropped")
                                }
                                Button {
                                    
                                } label: {
                                    Text("Plan to Watch")
                                }
                            } label: {
                                Text("Watching")
                                Image(systemName: "chevron.down")
                            }
                            .buttonStyle(.borderedProminent)
                            
                            Picker("Episodes", selection: $viewModel.currentEpisode) {
                                ForEach(0...13, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.menu)
                            Text("/ 13")
                            
                            Button {
                                $viewModel.currentEpisode.wrappedValue += 1
                            } label: {
                                Image(systemName: "plus.circle.fill")
                            }
                        }
                    }
                    .padding()
                }
                
                VStack(alignment: .leading, spacing: 8) {
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
                .frame(maxWidth: .infinity)
                .padding()
                .previewBackground()
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .center, spacing: 16) {
                        // ForEach
                        VStack(alignment: .leading) {
                            Text("Format")
                                .font(.headline)
                            
                            Text("TV")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Episodes")
                                .font(.headline)
                            
                            Text("22")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Episode Duration")
                                .font(.headline)
                            
                            Text("25 mins")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Status")
                                .font(.headline)
                            
                            Text("Finished")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Start Date")
                                .font(.headline)
                            
                            Text("Oct 14, 2017")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("End Date")
                                .font(.headline)
                            
                            Text("Mar 31, 2018")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Season")
                                .font(.headline)
                            
                            Text("Fall 2017")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Average Score")
                                .font(.headline)
                            
                            Text("89%")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Mean Score")
                                .font(.headline)
                            
                            Text("89%")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Genres")
                                .font(.headline)
                                
                            Text("Drama, Slice of Life")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                        }
                    }
                    .padding()
                }
                .previewBackground()
                
                VStack(alignment: .leading) {
                    Text("External & Streaming links")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .center, spacing: 16) {
                            // ForEach
                            HStack(alignment: .center) {
                                Image(systemName: "link")
                                
                                Text("Official Site")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                            
                            HStack(alignment: .center) {
                                Image(systemName: "link")
                                
                                Text("Twitter")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                            
                            HStack(alignment: .center) {
                                Image(systemName: "link")
                                
                                Text("Crunchyrroll")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                            
                            HStack(alignment: .center) {
                                Image(systemName: "link")
                                
                                Text("Funimation")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                            
                            HStack(alignment: .center) {
                                Image(systemName: "link")
                                
                                Text("Netflix")
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .padding()
                .previewBackground()
            }
            .padding(.bottom, 16)
        }
        .coordinateSpace(name: CoordinateSpaces.scrollView)
        .edgesIgnoringSafeArea(.top)
        .navigationTitle("3-Gatsu no Lion 2")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(showToolBar ? .visible : .hidden)
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("ic_back") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                Text("<")
            }
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
                    .readSize { imageSize in
                        self.imageSize = imageSize
                    }
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
        NavigationView {
            MediaDetailView(viewModel: MediaDetailViewModel())
        }
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

extension View {
    var isPreview: Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    func previewBackground() -> some View {
        self
            .background(
                isPreview ? Color(
                    UIColor(
                        red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1
                    )
                ) : Color.clear)
    }
}
