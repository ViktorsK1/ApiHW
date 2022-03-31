//
//  DetailPostImageTableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit
import SnapKit

class DetailPostImageTableViewCell: UITableViewCell {

    let fullImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(fullImageView)
        
        fullImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func apply(image: PostIDDetailData) {
//        fullImageView.image = image.images
    }
}
