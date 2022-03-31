//
//  DetailPostTableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit
import SnapKit

class DetailPostTextTableViewCell: UITableViewCell {

    private let titleLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.numberOfLines = 0
        uilabel.textAlignment = .justified
        uilabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25.0)
        return uilabel
    }()
    
    private let fullTextLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.numberOfLines = 0
        uilabel.textAlignment = .natural
        uilabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20.0)
        return uilabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(fullTextLabel)
        
        makeConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        fullTextLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func setUp(title: String?, fullText: String?) {
        titleLabel.text = title ?? ""
        fullTextLabel.text = fullText ?? ""
    }
}
