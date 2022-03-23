//
//  ViewController.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit

class PostListVC: UIViewController {

    let mainView = PostListView()
//    var apiData:
    
    override func loadView() {
        configView()
        setTitle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configView() {
        self.view = mainView
        mainView.apiTableView.delegate = self
        mainView.apiTableView.dataSource = self
        mainView.apiTableView.register(CustomTableCell.self, forCellReuseIdentifier: "reuseIdentifierTableView")
    }
    
    func setTitle() {
        navigationItem.title = "Test Task"
    }
}

extension PostListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

extension PostListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierTableView", for: indexPath) as! CustomTableCell
        return cell
    }
    
    
}
