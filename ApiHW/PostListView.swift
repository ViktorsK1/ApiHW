//
//  PostListView.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit
import PinLayout

class PostListView: UIView {

    let apiTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(apiTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        apiTableView.pin.all()
    }
}
