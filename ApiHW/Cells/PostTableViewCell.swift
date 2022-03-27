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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        
        previewTextLabel.numberOfLines = 2
        contentView.addSubview(previewTextLabel)
        
        fullTextButton.setTitle("показать больше", for: .normal)
        fullTextButton.backgroundColor = .orange
        contentView.addSubview(fullTextButton)
        
        likeLabel.textAlignment = .center
        contentView.addSubview(likeLabel)
        
        likesCountLabel.textAlignment = .left
        contentView.addSubview(likesCountLabel)
        
        timeshampLabel.textAlignment = .right
        contentView.addSubview(timeshampLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        previewTextLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        fullTextButton.snp.makeConstraints {
            $0.top.equalTo(previewTextLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        likesCountLabel.snp.makeConstraints {
            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(10)
            $0.bottom.equalToSuperview()
        }
        
        timeshampLabel.snp.makeConstraints {
            $0.top.equalTo(fullTextButton.snp.bottom).offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func apply(_ vm: PostCellViewModel) {
        titleLabel.text = vm.data.title ?? ""
        previewTextLabel.text = vm.data.preview_text ?? ""
        previewTextLabel.numberOfLines = vm.isWider ? 0 : 2
        if vm.isWider {
            fullTextButton.setTitle("показать меньше", for: .normal)
        }
        likesCountLabel.text = "\(vm.data.likes_count ?? 0)"
        timeshampLabel.text = "\(vm.data.timeshamp ?? 0)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
