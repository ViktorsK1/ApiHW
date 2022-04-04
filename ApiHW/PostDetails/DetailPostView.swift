//
//  DetailPostView.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit
import SnapKit

class DetailPostView: UIView {

    let detailApiTableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        
        addSubview(detailApiTableView)
        detailApiTableView.allowsSelection = false
        detailApiTableView.separatorStyle = .none
        
        detailApiTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
