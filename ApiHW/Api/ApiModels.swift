//
//  ApiModels.swift
//  ApiHW
//
//  Created by Виктор Куля on 23.03.2022.
//

import Foundation

struct PostsModel: Codable {
    let posts: [PostsData]
}

struct PostsData: Codable {
    let title: String?
    let preview_text: String?
    let likes_count: Int?
    let timeshamp: Int?
}
