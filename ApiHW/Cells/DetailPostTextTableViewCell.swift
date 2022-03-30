//
//  DetailPostTableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit
import SnapKit

class DetailPostTextTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let fullTextLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        
        contentView.addSubview(fullTextLabel)
        fullTextLabel.numberOfLines = 0
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        fullTextLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func applyText(_ vm: PostIDDetailData) {
        titleLabel.text = vm.title ?? ""
        fullTextLabel.text = vm.text ?? ""
    }
}
