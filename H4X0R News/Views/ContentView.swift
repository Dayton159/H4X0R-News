//
//  ContentView.swift
//  H4X0R News
//
//  Created by Dayton on 09/07/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            
            //whenever the post changes, it will trigger a rebuild of the list updating everything inside
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("H4X0R News")
        }
            
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//
//let posts = [
//        Post(id: "1", title: "Hello"),
//        Post(id: "2", title: "Bonjour"),
//        Post(id: "3", title: "Hola")
//]
