//
//  ViewController.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit

class PostListVC: UIViewController {

    private let viewModel = PostListViewModel()
    private let mainView = PostListView()

    override func loadView() {
        view = mainView
        title = "Test Task"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.backgroundColor = UIColor.black
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationController?.navigationBar.standardAppearance = navigationBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        }
        
        mainView.apiTableView.delegate = self
        mainView.apiTableView.dataSource = self
        mainView.apiTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierTableView")
        
        viewModel.attach(view: self)
        viewModel.viewBecomesReady()
    }
    
    @objc func showMoreButtonIsPressed(sender: UIButton){
        viewModel.showMoreButtonIsPressed(tag: sender.tag)
    }
}

extension PostListVC: UITableViewDataSource, UITableViewDelegate {
    
    private var cellDetailData: [PostCellData] {
        viewModel.cellDetailData
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellDetailData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierTableView", for: indexPath) as! PostTableViewCell
        cell.apply(cellDetailData[indexPath.row])
        cell.fullTextButton.addTarget(self, action: #selector(showMoreButtonIsPressed(sender:)), for: .touchUpInside)
        cell.fullTextButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailPostVC(postId: cellDetailData[indexPath.row].postId)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PostListVC: PostListViewProtocol {
    func dataWasUpdated() {
        DispatchQueue.main.async { [weak self] in
            self?.mainView.apiTableView.reloadData()
        }
    }
}
