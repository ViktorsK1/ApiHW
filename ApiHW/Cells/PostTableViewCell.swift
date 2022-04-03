//
//  TableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit
import SnapKit

struct PostCellViewModel {
    let data: PostsDetailData
    var isWider: Bool
}

class PostTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let previewTextLabel = UILabel()
    let fullTextButton = UIButton()
    let likeLabel = UILabel()
    let likesCountLabel = UILabel()
    let timeshampLabel = UILabel()
    let separatorLineLabel = UILabel()
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.timeStyle = .full
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter
    }()
    
    private var likesAndTimeView: LikesAndTimeView = {
        let uiView = LikesAndTimeView()
        uiView.backgroundColor = .brown
        return uiView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .natural
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 21.0)
        contentView.addSubview(titleLabel)
        
        previewTextLabel.numberOfLines = 2
        previewTextLabel.textAlignment = .natural
        previewTextLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15.0)
        contentView.addSubview(previewTextLabel)
        
        fullTextButton.setTitle("показать больше", for: .normal)
        fullTextButton.backgroundColor = .orange
        contentView.addSubview(fullTextButton)
        
//        likeLabel.text = "🖤"
//        likeLabel.textAlignment = .center
//        contentView.addSubview(likeLabel)
//        
//        likesCountLabel.textAlignment = .left
//        contentView.addSubview(likesCountLabel)
//        
//        timeshampLabel.textAlignment = .right
//        contentView.addSubview(timeshampLabel)

        separatorLineLabel.backgroundColor = .lightGray
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
        
//        likeLabel.snp.makeConstraints {
//            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
//            $0.leading.equalToSuperview().offset(10)
//        }
//
//        likesCountLabel.snp.makeConstraints {
//            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
//            $0.leading.equalTo(likeLabel.snp.trailing).offset(10)
//        }
//
//        timeshampLabel.snp.makeConstraints {
//            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
//            $0.trailing.equalToSuperview().offset(-10)
//        }
        
        likesAndTimeView.snp.makeConstraints() {
            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
//            $0.height.equalTo(40)
        }
        
        
        separatorLineLabel.snp.makeConstraints {
            $0.top.equalTo(likesAndTimeView.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(10)
            $0.bottom.equalToSuperview()
        }
    }
    
    func apply(_ vm: PostCellViewModel) {
        titleLabel.text = vm.data.title ?? ""
        previewTextLabel.text = (vm.data.preview_text ?? "").plainText
        previewTextLabel.numberOfLines = vm.isWider ? 0 : 2
        if vm.isWider {
            fullTextButton.setTitle("показать меньше", for: .normal)
        }
//        likesCountLabel.text = "\(vm.data.likes_count ?? 0)"
//        
//        let epochTime = TimeInterval(vm.data.timeshamp ?? 0) / 1000
//        let date = Date(timeIntervalSinceNow: -epochTime)
//        let dateString = formatter.string(from: date)
//        timeshampLabel.text = dateString
//        likesAndTimeView

    }
    
//    func setLikesAndTime(_ vm: PostCellViewModel) {
//        likesAndTimeView.setLikesAndTime(vm)
//    }
}
