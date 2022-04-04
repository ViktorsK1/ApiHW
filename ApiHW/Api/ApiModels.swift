//
//  ApiModels.swift
//  ApiHW
//
//  Created by Виктор Куля on 23.03.2022.
//

import Foundation

struct PostsModel: Codable {
    let posts: [PostsDetailData]
}

struct PostsDetailData: Codable {
    let postId: Int
    let title: String?
    let preview_text: String?
    let likes_count: Int?
    let timeshamp: Int?
}

struct PostDetailData {
    let title: String?
    let previwText: String?
    
}

struct PostIDData: Codable {
    let post: PostIDDetailData
}

struct PostIDDetailData: Codable {
    let postId: Int
    let timeshamp: Int?
    let title: String?
    let text: String?
    let images: [String]?
    let likes_count: Int?
}
