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
        let uiLabel = UILabel()
        uiLabel.text = "♥️"
        uiLabel.textAlignment = .center
        return uiLabel
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
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.timeStyle = .full
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
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
    
    func setUp(likesCount: Int?, timesShamp: Int?) {
        likesCountLabel.text = "\(likesCount ?? 0)"
        
        let epochTime = TimeInterval(timesShamp ?? 0) / 1000
        let date = Date(timeIntervalSinceNow: -epochTime)
        let dateString = formatter.string(from: date)
        timeshampLabel.text = dateString
    }
}
