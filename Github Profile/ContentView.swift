//
//  ContentView.swift
//  Github Profile
//
//  Created by Арсений Дунаев on 20.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var user1:GitHubUser?
    @State private var user2:GitHubUser?
    @State private var user3:GitHubUser?
    @State private var user4: GitHubUser?
    let placeholderUser: GitHubUser = GitHubUser(login: "Placeholder", avatarUrl: "", name: "Placeholder", location: "Placeholder", bio: "Placeholder", followers: 0, following: 0)
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    UserProfile(user: user1 ?? placeholderUser)
                } label: {
                    Text (user1?.login ?? "N/A")
                }
                
                NavigationLink {
                    UserProfile(user: user2 ?? placeholderUser)
                } label: {
                    Text(user2?.login ?? "N/A")
                }
                
                NavigationLink {
                    UserProfile(user: user3 ?? placeholderUser)
                } label: {
                    Text(user3?.login ?? "N/A")
                }
                
                NavigationLink {
                    UserProfile(user: user4 ?? placeholderUser)
                } label: {
                    Text(user4?.login ?? "N/A")
                }
            }
            .navigationTitle("GitHub")
        }
        .task {
            do {
                user1 = try await getUser(username: "ArsenyD")
                user2 = try await getUser(username: "froggOG")
                user3 = try await getUser(username: "sallen0400")
                user4 = try await getUser(username: "twostraws")
            } catch GHErrors.invalidURL{
               print("Invalid URl")
            } catch GHErrors.invalidData {
                print("Invalid Data")
            } catch {
                print("Something went wrong")
            }
        }
    }
    
    
    func getUser(username: String) async throws -> GitHubUser {
        
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            throw GHErrors.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        }
        catch {
            throw GHErrors.invalidData
        }
    }
    
    enum GHErrors: Error {
        case invalidURL
        case invalidData
    }
}

#Preview {
    ContentView()
}
