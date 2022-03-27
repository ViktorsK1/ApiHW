//
//  Networking.swift
//  ApiHW
//
//  Created by Виктор Куля on 24.03.2022.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

class NetworkingServise {
    
    func fetchPosts(with completion: ((Result<PostsData>) -> Void)?) {
    
        var request = URLRequest(url: Constants.postsURL)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    do {
                        let data = try decoder.decode(PostsData.self, from: jsonData)
                        completion?(.success(data))
                    } catch {
                        completion?(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
