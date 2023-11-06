//
//  UserProfile.swift
//  Github Profile
//
//  Created by Арсений Дунаев on 20.10.2023.
//

import SwiftUI

struct UserProfile: View {
    let user: GitHubUser
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: user.avatarUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            } placeholder: {
                Circle()
            }
            .frame(width: 200, height: 150)
            
            VStack {
                Text("\(user.login)")
                    .font(.title).bold()
                Text("\(user.bio ?? "N/A")")
                    .font(.caption).fontWeight(.light)
            }
            .frame(width: 200)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Name: \(user.name ?? "N/A")")
                    .padding(.top, 20)
                Text("Location: \(user.location ?? "N/A")")
                Text("Following: \(user.following)")
                Text("Followers: \(user.followers)")
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    UserProfile(user: GitHubUser(login: "Placeholder", avatarUrl: "", name: "Placeholder", location: "Placeholder", bio: "Placeholder", followers: 0, following: 0))
}
