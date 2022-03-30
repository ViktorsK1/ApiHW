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
    
    func fetchPosts(with completion: ((Result<PostsModel>) -> Void)?) {
    
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
                        let data = try decoder.decode(PostsModel.self, from: jsonData)
                        completion?(.success(data))
                    } catch {
                        completion?(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
    
    func fetchPost(with id: Int, _ completion: ((Result<PostIDDetailData>) -> Void)?) {
    
        guard let url = URL(string: "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/\(id).json") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    do {
                        let data = try decoder.decode(PostIDDetailData.self, from: jsonData)
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
