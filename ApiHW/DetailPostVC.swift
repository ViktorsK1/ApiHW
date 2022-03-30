//
//  DetailPostVC.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit

class DetailPostVC: UIViewController {
    

    

    private let mainView = DetailPostView()
    private let networkingServise = NetworkingServise()
//    private var cellDetailPostText: [DetailPostTextCellViewModel]
//    private let cellDetailPostImage: [DetailPostImageCellViewModel]
//    private let cellDetailPostLikesAndTimeshamp: [DetailPostLikesAndTimeshampCellViewModel]

    private let postId: Int
    
    init(postId: Int) {
        self.postId = postId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        configView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(postId)"
        
        networkingServise.fetchPost(with: postId) { result in
            print(result)
        }
//        networkingServise.fetchPosts { [weak self] result in
//            switch result {
//            case .success(let dataApiText):
//                self?.apiDataText = dataApiText.posts
//            case .failure(let error):
//                print(error)
//            }
//        }
        
    }
    
    func configView() {
        view = mainView
//        mainView.detailApiTableView.delegate = self
//        mainView.detailApiTableView.dataSource = self
        mainView.detailApiTableView.register(DetailPostTextTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierTextTableView")
        mainView.detailApiTableView.register(DetailPostImageTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierImageTableView")
        mainView.detailApiTableView.register(DetailPostLikesAndTimeshampTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierLikesAndTimeshampTableView")
    }
}

//extension DetailPostVC: UITableViewDelegate {
//
//}
//
//extension DetailPostVC: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        4
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        switch indexPath.section {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierTextTableView", for: indexPath) as! DetailPostTextTableViewCell
//
//
//            return cell
//
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierImageTableView", for: indexPath) as! DetailPostImageTableViewCell
//
//            return cell
//
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierLikesAndTimeshampTableView", for: indexPath) as! DetailPostLikesAndTimeshampTableViewCell
//
//            return cell
//
//        default:
//            fatalError()
//        }
//
//    }
//
//
//}
