//
//  ViewController.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit

class PostListVC: UIViewController {

    private let mainView = PostListView()
    private let networkingServise = NetworkingServise()
    private(set) var cellDetailData = [PostCellViewModel]() {
        didSet {
            mainView.apiTableView.reloadData()
        }
    }
    
    override func loadView() {
        configView()
        setTitle()
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
        
        networkingServise.fetchPosts { [weak self] result in
            switch result {
            case .success(let dataApi):
                self?.cellDetailData = dataApi.posts
                    .map({ PostCellViewModel(data: $0, isWider: false) })
                    .sorted(by: { vm1, vm2 in
                        vm1.data.timeshamp ?? 1 > vm2.data.timeshamp ?? 0
                    })
            case .failure(let error):
                print(error)
            }
        }
    }

    func configView() {
        view = mainView
        mainView.apiTableView.delegate = self
        mainView.apiTableView.dataSource = self
        mainView.apiTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "reuseIdentifierTableView")
        
    }
    
    func setTitle() {
        navigationItem.title = "Test Task"
    }
}

extension PostListVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        400
//    }
    
}

extension PostListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellDetailData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierTableView", for: indexPath) as! PostTableViewCell
        cell.apply(cellDetailData[indexPath.row])
        cell.fullTextButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        cell.fullTextButton.tag = indexPath.row

        return cell
    }
    
    @objc func connected(sender: UIButton){
        cellDetailData[sender.tag].isWider = !cellDetailData[sender.tag].isWider
        
        mainView.apiTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailPostVC(postId: cellDetailData[indexPath.row].data.postId)
        navigationController?.pushViewController(vc, animated: true)
    }
}
