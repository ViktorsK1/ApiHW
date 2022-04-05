//
//  TableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit
import SnapKit

struct PostCellData {
    let postId: Int
    let title: String?
    let previewText: String?
    let likesCount: Int?
    let timeString: String?
    var isWider: Bool
}

class PostTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.numberOfLines = 0
        uiLabel.textAlignment = .natural
        uiLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 21.0)
        return uiLabel
    }()
    
    private let previewTextLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.numberOfLines = 2
        uiLabel.textAlignment = .natural
        uiLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15.0)
        return uiLabel
    }()
    
    let fullTextButton: UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("показать больше", for: .normal)
        uiButton.backgroundColor = .black
        return uiButton
    }()
    
    private let separatorLineLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.backgroundColor = .lightGray
        return uiLabel
    }()
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.timeStyle = .full
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
    
    private var likesAndTimeView = LikesAndTimeView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)
        
        contentView.addSubview(previewTextLabel)
        
        contentView.addSubview(fullTextButton)
        
        contentView.addSubview(separatorLineLabel)
        
        contentView.addSubview(likesAndTimeView)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func makeConstraints() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        previewTextLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        fullTextButton.snp.makeConstraints {
            $0.top.equalTo(previewTextLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        likesAndTimeView.snp.makeConstraints() {
            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        separatorLineLabel.snp.makeConstraints {
            $0.top.equalTo(likesAndTimeView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(10)
            $0.bottom.equalToSuperview()
        }
    }
    
    func apply(_ vm: PostCellData) {
        titleLabel.text = vm.title ?? ""
        previewTextLabel.text = (vm.previewText ?? "").plainText
        previewTextLabel.numberOfLines = vm.isWider ? 0 : 2
        if vm.isWider {
            fullTextButton.setTitle("показать меньше", for: .normal)
        }
        
        guard let likesCount = vm.likesCount, let timeShamp = vm.timeString else { return }
        likesAndTimeView.setData(likesCount: likesCount, timesShampText: timeShamp)
    }
}
