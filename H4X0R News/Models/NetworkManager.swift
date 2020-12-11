//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Dayton on 09/07/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import Foundation


class NetworkManager:ObservableObject {
    
    
    //after inserting the results data into posts array,
    // publish our post to any interesting party
    @Published var posts = [Post]()
    
    func fetchData()  {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    
                    let decoder = JSONDecoder()
                    
                    if let safeData = data{
                        
                        do{
                            let results = try decoder.decode(Result.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                 //results.hits = an array of post object
                        self.posts = results.hits
                            }
                                       
                        }catch{
                            print(error)
                        }
                    }
                    
                }
            }
            
            task.resume()
            
        }
    }
}
