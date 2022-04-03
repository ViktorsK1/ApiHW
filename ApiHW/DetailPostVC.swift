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
    private let postId: Int
    private(set) var viewModel: PostIDDetailData? {
        didSet {
            title = viewModel?.title
            mainView.detailApiTableView.reloadData()
        }
    }
    private(set) var images = ThreadSafeArray<UIImage>()
    
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
        
        networkingServise.fetchPost(with: postId) { [weak self] result in
            switch result {
            case .success(let data):
                self?.viewModel = data
                guard let dataImage = data.images else { return }

                dataImage.forEach { url in
                    self?.networkingServise.downloadImage(from: url) { image in
                        self?.images.append(image)
                        DispatchQueue.main.async {
                            self?.mainView.detailApiTableView.reloadSections(.init(integer: 1), with: .none)
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func configView() {
        view = mainView
        mainView.detailApiTableView.delegate = self
        mainView.detailApiTableView.dataSource = self
        mainView.detailApiTableView.register(DetailPostTextTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierTextTableView")
        mainView.detailApiTableView.register(DetailPostImageTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierImageTableView")
        mainView.detailApiTableView.register(DetailPostLikesAndTimeshampTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierLikesAndTimeshampTableView")
    }
}

extension DetailPostVC: UITableViewDelegate {

}

extension DetailPostVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 1 ? images.count : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierTextTableView", for: indexPath) as! DetailPostTextTableViewCell
            cell.setUp(title: viewModel?.title, fullText: viewModel?.text)
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierImageTableView", for: indexPath) as! DetailPostImageTableViewCell
            if let image = images.get(index: indexPath.row) {
                cell.apply(image: image, width: tableView.bounds.size.width)
            }
            return cell

        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierLikesAndTimeshampTableView", for: indexPath) as! DetailPostLikesAndTimeshampTableViewCell
            cell.setUp(likesCount: viewModel?.likes_count, timesShamp: viewModel?.timeshamp)
            return cell

        default:
            return UITableViewCell()
        }
    }
}
