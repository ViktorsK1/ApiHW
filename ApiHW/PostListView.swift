//
//  PostListView.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit
import PinLayout
import SnapKit

class PostListView: UIView {

    let apiTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        apiTableView.allowsSelection = false
        apiTableView.separatorStyle = .none
        addSubview(apiTableView)
        
        apiTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
