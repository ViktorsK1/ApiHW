//
//  DetailPostLikesAndTimeshampTableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 29.03.2022.
//

import UIKit
import SnapKit

class DetailPostLikesAndTimeshampTableViewCell: UITableViewCell {

    private let likeLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "♥️"
        uilabel.textAlignment = .center
        return uilabel
    }()
    
    private let likesCountLabel: UILabel = {
       let uilabel = UILabel()
        uilabel.textAlignment = .left
        return uilabel
    }()
    
    private let timeshampLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.textAlignment = .right
        return uilabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(likeLabel)
        contentView.addSubview(likesCountLabel)
        contentView.addSubview(timeshampLabel)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setUp(likesCount: Int?, timesShamp: Int?) {
        likesCountLabel.text = "\(likesCount ?? 0)"
        timeshampLabel.text = "\(timesShamp ?? 0)"
    }
    
    private func makeConstraints() {
        likeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        likesCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(10)
        }
        
        timeshampLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
}
