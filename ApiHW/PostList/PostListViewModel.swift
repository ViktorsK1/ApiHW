//
//  PostListViewModel.swift
//  ApiHW
//
//  Created by Виктор Куля on 04.04.2022.
//

import Foundation

protocol PostListViewProtocol: AnyObject {
    func dataWasUpdated()
}

class PostListViewModel {
    private(set) var cellDetailData = [PostCellData]() {
        didSet {
            view?.dataWasUpdated()
        }
    }
    
    private let networkingServise = NetworkingServise()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.timeStyle = .full
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
    
    private weak var view: PostListViewProtocol?
    
    func attach(view: PostListViewProtocol) {
        self.view = view
    }
    
    func showMoreButtonIsPressed(tag: Int) {
        cellDetailData[tag].isWider = !cellDetailData[tag].isWider
        view?.dataWasUpdated()
    }
    
    func viewBecomesReady() {
        networkingServise.fetchPosts { [weak self] result in
            switch result {
            case .success(let dataApi):
                self?.cellDetailData = dataApi.posts
                    .map({ post in
                        let timeShamp = post.timeshamp.map { [weak self] time -> String in
                            let epochTime = TimeInterval(time) / 1000
                            let date = Date(timeIntervalSinceNow: -epochTime)
                            return self?.dateFormatter.string(from: date) ?? ""
                        }
                        return PostCellData(postId: post.postId, title: post.title, previewText: post.preview_text, likesCount: post.likes_count, timeString: timeShamp, isWider: false)
                    })
                    .sorted(by: { vm1, vm2 in
                        vm1.likesCount ?? 1 > vm2.likesCount ?? 0
                    })
            case .failure(let error):
                print(error)
            }
        }
    }
}
