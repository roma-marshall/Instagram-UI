//
//  ContentView.swift
//  Instagram UI
//
//  Created by Roma Marshall on 25.02.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Instagram")
                    .padding(.horizontal, 10)
                    .font(.title)
                
                Spacer()
                
                HStack(spacing: 15) {
                    Text("➕")
                    Text("❤️")
                    Text("✈️")
                }
                .padding(.horizontal, 10)
                .font(.title)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(userData) { item in
                        AvatarView(user: item)
                    }
                }
                .padding(.leading, 10)
                
            }
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(userData) { item in
                    LoopView(user: item)
                }
            }
            
            Divider()
            
            HStack(spacing: 50) {
                Text("🏠")
                Text("🔍")
                Text("🎬")
                Text("🛍")
                Text("🎭")
            }
            .padding(.horizontal, 10)
            .font(.title)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AvatarView: View {
    var user: User
    var body: some View {
        VStack {
            //            Image("avatar")
            user.avatar
                .resizable()
                .frame(width: 55, height: 55, alignment: .center)
                .cornerRadius(30)
                .padding(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .bottomLeading, endPoint: .trailing), lineWidth: 2.5)
                )
            if user.username == "roma_marshall" {
                Text("Your Story")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            } else {
                Text(user.username)
                    .font(.system(size: 12))
            }
            
        }
    }
}

struct LoopView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    var user: User
    var body: some View {
        VStack {
            HStack {
                VStack {
                    //                    Image("avatar")
                    user.avatar
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .cornerRadius(30)
                        .padding(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .bottomLeading, endPoint: .trailing), lineWidth: 1.5)
                        )
                }
                VStack(alignment: .leading) {
                    Text(user.username)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                    Text(user.location)
                        .font(.system(size: 9))
                }
                Spacer()
                Text("...")
                    .padding(.bottom, 8)
                    .font(.headline)
            }
            .padding(.horizontal, 8)
            
            
            //            Image("avatar")
            user.avatar
                .resizable()
                .frame(width: screenWidth, height: screenWidth)
            
            HStack(spacing: 15) {
                Text("❤️")
                Text("✉️")
                Text("✈️")
                
                Spacer()
                
                Text("🔰")
            }
            .padding(.horizontal, 10)
            .font(.title2)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Likes: \(user.like)")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    HStack {
                        Text(user.username)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Text(user.description)
                            .font(.system(size: 15))
                    }
                    
                }
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 1)
            
            Spacer()
            
        }
        .padding(.bottom, 8)
    }
}


struct User: Identifiable {
    var id = UUID()
    var username: String
    var avatar: Image
    var location: String
    var description: String
    var like: String
}

let userData = [
    User(username: "roma_marshall", avatar: Image("roma_marshall"), location: "Germany, Frankfurt", description: "Hi there, this is my SwiftUI Project 🚀", like: "12.738"),
    User(username: "durov", avatar: Image("durov"), location: "Bali, Denpasar", description: "A flashback from Bali to remind you guys about challenge.", like: "11.243"),
    User(username: "zuck", avatar: Image("zuck"), location: "USA, California", description: "This year feels like a good time to celebrate overcoming adversity", like: "9923"),
    User(username: "johnnydepp", avatar: Image("johnnydepp"), location: "Franсe, Paris", description: "Hello everyone... filming something for you now... gimme a minute", like: "34.423"),
    User(username: "travisscott", avatar: Image("travisscott"), location: "Italy, Rom", description: "Lookin just like mommy in that second one.", like: "3902"),
    User(username: "jeffbezos", avatar: Image("jeffbezos"), location: "Spain, Barcelona", description: "We might have given Alexa a little upgrade...", like: "5524"),
    
]
