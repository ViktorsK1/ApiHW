//
//  LikesAndTimeView.swift
//  ApiHW
//
//  Created by Виктор Куля on 03.04.2022.
//

import UIKit

class LikesAndTimeView: UIView {

    private let likeLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.text = "♥️"
        uiLabel.textAlignment = .center
        return uiLabel
    }()
    
    private let likesCountLabel: UILabel = {
       let uiLabel = UILabel()
        uiLabel.textAlignment = .left
        return uiLabel
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
    
    init() {
        super.init(frame: .zero)
        layer.cornerRadius = 10
        addSubview(likeLabel)
        addSubview(likesCountLabel)
        addSubview(timeshampLabel)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLikesAndTime(_ vm: PostCellViewModel) {
        likesCountLabel.text = "\(vm.data.likes_count ?? 0)"
        
        let epochTime = TimeInterval(vm.data.timeshamp ?? 0) / 1000
        let date = Date(timeIntervalSinceNow: -epochTime)
        let dateString = formatter.string(from: date)
        timeshampLabel.text = dateString
        
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
