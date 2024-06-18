//
//  ContentView.swift
//  Spotify UI Clone
//
//  Created by Alex on 03/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Background()
            VStack {
                Cover()
                
                VStack{
                    ArtistInfo()
                    Controls()
                    
                    VStack(spacing: 24){
                       Track(name: "Lunch", artists: "Billie Eilish", explicit: false, playing: false)
                        
                        Track(name: "Love", artists: "Billie Eilish", explicit: true, playing: true)
                        
                        Track(name: "high", artists: "Billie Eilish", explicit: true, playing: false)
                        
                        Track(name: "battle", artists: "Billie Eilish", explicit: true, playing: false)
                    }.padding(.top)
                }
                Spacer()
            }
            
            VStack{
                MediaPlayer()
                Menu()
            }
            .background(Color(#colorLiteral(red: 0.1568410099, green: 0.1568752527, blue: 0.1568388343, alpha: 1)))
            .offset(y: UIScreen.main.bounds.height / 2 - 75)
            
        }.foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Background: View{
    
    let colors: [Color] = [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)), Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.08821473271, green: 0.1449819803, blue: 0.1618441939, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1)), Color(#colorLiteral(red: 0.07057534903, green: 0.07059564441, blue: 0.07057406753, alpha: 1))]
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Cover: View{
    var body: some View{
        ZStack(alignment: .top){
            Image("cover")
                .resizable()
                .frame(width: 220, height: 220)
                .shadow(radius: 5)
            
            Image(systemName: "chevron.left")
                .offset(x: -165)
                .font(.system(size: 20))
        }
    }
}

struct ArtistInfo: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text("Hit me hard n soft")
                    .font(.system(size: 25, weight: .bold))
                
                HStack{
                    Image("profilePic")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    
                    Text("Billie Eilish")
                        .font(.system(size: 14, weight: .bold))
                }
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
        }
    }
}

struct Controls: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text("Album")
                    Circle()
                        .frame(width: 3, height: 3)
                    Text("2024")
                }
                
                HStack(spacing: 25){
                    Image(systemName: "heart")
                    Image(systemName: "arrow.down.circle")
                    Image(systemName: "ellipsis")
                }
                .font(.system(size: 25))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            .font(.system(size: 14))
            
            Spacer()
            
            ZStack(alignment: .bottomTrailing){
                ZStack{
                    Circle()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)))
                    
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                
                ZStack{
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Image(systemName: "shuffle")
                        .foregroundColor(Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)))
                        .font(.system(size: 10))
                }
            }
        }.padding(.horizontal)
    }
}

struct Track: View{
    let name: String
    let artists: String
    let explicit: Bool
    let playing: Bool
    
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                    .font(.system(size: 14))
                    .foregroundColor(playing ? Color(#colorLiteral(red: 0.1079577729, green: 0.7236167789, blue: 0.3314852118, alpha: 1)) : .white)
                
                HStack{
                    
                    if explicit{
                        Image(systemName: "e.square.fill")
                    }
                    
                    Text(artists)
                        .font(.system(size: 12))
                }
                .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
        }
        .padding(.horizontal)
    }
}

struct MediaPlayer: View{
    var body: some View{
        HStack{
            HStack{
                Image("cover")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading){
                    Text("Love")
                    Text("Billie Eilish")
                        .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
                }
                .font(.system(size: 14))
            }
            
            Spacer()
            
            HStack(spacing: 35){
                Image(systemName: "hifispeaker")
                    .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
                Image(systemName: "play.fill")
            }
            .font(.system(size: 25))
            .padding(.trailing)
        }
        .border(Color.black, width: 0.3)
    }
}

struct Menu: View{
    var body: some View{
        HStack{
            
            VStack(spacing: 8){
                Image(systemName: "house")
                    .font(.system(size: 20))
                
                Text("Home")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
            
            Spacer()
            
            VStack(spacing: 8){
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                
                Text("Search")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            VStack(spacing: 8){
                Image(systemName: "text.justifyright")
                    .rotationEffect(.degrees(90))
                    .font(.system(size: 20))
                
                Text("Home")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(#colorLiteral(red: 0.6901075244, green: 0.6901670098, blue: 0.6941940188, alpha: 1)))
        }
        .padding(.bottom, 30)
        .padding(.top, 2)
        .padding(.horizontal, 40)
    }
}
