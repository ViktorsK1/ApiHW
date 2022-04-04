//
//  DetailPostImageTableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit
import SnapKit

class DetailPostImageTableViewCell: UITableViewCell {

    private let fullImageView: UIImageView = {
        let imageView =  UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(fullImageView)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func makeConstraints() {
        fullImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(0)
        }
    }
    
    func apply(image: UIImage, width: CGFloat) {
        fullImageView.image = image
        fullImageView.snp.updateConstraints {
            $0.height.equalTo(width * image.size.height / image.size.width)
        }
    }
}
