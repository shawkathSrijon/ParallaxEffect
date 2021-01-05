//
//  ContentView.swift
//  ParallaxEffect
//
//  Created by Simec Sys Ltd. on 20/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State private var opacity = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    GeometryReader { geometry in
                        VStack {
                            Image("p1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + UIScreen.main.bounds.height / 2.2 : UIScreen.main.bounds.height / 2.2)
                                .offset(y: -geometry.frame(in: .global).minY)
//                                .onChange(of: geometry.frame(in: .global)) { val in
//
//                                }
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(albums, id: \.album_name) { album in
                            HStack(spacing: 15) {
                                Image("\(album.album_cover)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(15)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("\(album.album_name)")
                                    Text("\(album.album_author)")
                                        .font(.caption)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                    .background(Color.white)
                }
            }
            HStack {
                Button(action: {}) {
                    HStack(spacing: 15) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .bold))
                        Text("Search")
                    }
                }
                Spacer(minLength: 0)
                Button(action: {}) {
                    Image("menu")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 22, height: 22)
                        .rotationEffect(.init(degrees: 90))
                }
            }
            .padding()
            .foregroundColor(.white)
            .padding(.top, edges?.top)
            .background(Color.white.opacity(0))
        }
        //.ignoresSafeArea(.all, edges: .top)
        .edgesIgnoringSafeArea(.top)
    }
}

struct Album {
    var album_name : String
    var album_author : String
    var album_cover : String
}
  
var albums = [
    //Album(album_name: "Let Her Go", album_author: "Passenger", album_cover: "p1"),
    Album(album_name: "Bad Blood", album_author: "Taylor Swift", album_cover: "p2"),
    Album(album_name: "Believer", album_author: "Kurt Hugo Schneider", album_cover: "p3"),
    Album(album_name: "Let Me Love You", album_author: "DJ Snake", album_cover: "p4"),
    Album(album_name: "Shape Of You", album_author: "Ed Sherran", album_cover: "p5"),
    Album(album_name: "Blank Space", album_author: "Taylor Swift", album_cover: "p6"),
    Album(album_name: "Havana", album_author: "Camila Cabello", album_cover: "p7"),
    Album(album_name: "Red", album_author: "Taylor Swift", album_cover: "p8"),
    Album(album_name: "I Like It", album_author: "J Balvin", album_cover: "p9"),
    Album(album_name: "Lover", album_author: "Taylor Swift", album_cover: "p10"),
    Album(album_name: "7/27 Harmony", album_author: "Camila Cabello", album_cover: "p11"),
    Album(album_name: "Joanne", album_author: "Lady Gaga", album_cover: "p12"),
    Album(album_name: "Roar", album_author: "Kay Perry", album_cover: "p13"),
    Album(album_name: "My Church", album_author: "Maren Morris", album_cover: "p14"),
    Album(album_name: "Part Of Me", album_author: "Katy Perry", album_cover: "p15"),
]
