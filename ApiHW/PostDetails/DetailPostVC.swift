//
//  DetailPostVC.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit

class DetailPostVC: UIViewController {
    
    private let viewModel: DetailPostViewModel
    private let mainView = DetailPostView()

    init(postId: Int) {
        self.viewModel = DetailPostViewModel(postId: postId)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mainView.detailApiTableView.delegate = self
        mainView.detailApiTableView.dataSource = self
        mainView.detailApiTableView.register(DetailPostTextTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierTextTableView")
        mainView.detailApiTableView.register(DetailPostImageTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierImageTableView")
        mainView.detailApiTableView.register(DetailPostLikesAndTimeshampTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierLikesAndTimeshampTableView")
        
        viewModel.attach(view: self)
        viewModel.viewBecomesReady()
    }
}

extension DetailPostVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 1 ? viewModel.images.count : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierTextTableView", for: indexPath) as! DetailPostTextTableViewCell
            cell.setUp(title: viewModel.viewData?.title, fullText: viewModel.viewData?.text)
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierImageTableView", for: indexPath) as! DetailPostImageTableViewCell
            if let image = viewModel.images.get(index: indexPath.row) {
                cell.apply(image: image, width: tableView.bounds.size.width)
            }
            return cell

        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierLikesAndTimeshampTableView", for: indexPath) as! DetailPostLikesAndTimeshampTableViewCell
            cell.setUp(likesCount: viewModel.viewData?.likes_count, timesShamp: viewModel.viewData?.timeshamp)
            return cell

        default:
            return UITableViewCell()
        }
    }
}

extension DetailPostVC: DetailPostViewProtocol {
    func dataWasUpdated() {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.detailApiTableView.reloadData()
        }
    }
}
