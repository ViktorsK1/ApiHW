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
    
    func setData(likesCount: Int, timesShampText: String) {
        likesCountLabel.text = "\(likesCount)"
        timeshampLabel.text = timesShampText
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
