//
//  DetailPostViewModel.swift
//  ApiHW
//
//  Created by Виктор Куля on 04.04.2022.
//

import Foundation
import UIKit

protocol DetailPostViewProtocol: AnyObject {
    func dataWasUpdated()
}

class DetailPostViewModel {
    private(set) var viewData: PostIDDetailData? {
        didSet {
            view?.dataWasUpdated()
//            detailApiTableView.reloadData()
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
    
    private(set) var images = ThreadSafeArray<UIImage>()

    private weak var view: DetailPostViewProtocol?
    
    private let postId: Int
 
    init(postId: Int) {
        self.postId = postId
    }
    
    func attach(view: DetailPostViewProtocol) {
        self.view = view
    }
    
    func viewBecomesReady() {
        networkingServise.fetchPost(with: postId) { [weak self] result in
            switch result {
            case .success(let data):
                self?.viewData = data
                guard let dataImage = data.images else { return }

                dataImage.forEach { url in
                    self?.networkingServise.downloadImage(from: url) { image in
                        self?.images.append(image)
                        DispatchQueue.main.async {
                            self?.view?.dataWasUpdated()
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
