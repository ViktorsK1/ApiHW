//
//  TableViewCell.swift
//  ApiHW
//
//  Created by Виктор Куля on 22.03.2022.
//

import UIKit

class CustomTableCell: UITableViewCell {

    let titleLabel = UILabel()
    let previewTextLabel = UILabel()
    let fullTextButton = UIButton()
    let timeshampLabel = UILabel()
    let likesCountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(titleLabel)
        
        addSubview(previewTextLabel)
        
        addSubview(fullTextButton)
        
        addSubview(timeshampLabel)
        
        addSubview(likesCountLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let padding: CGFloat = 10
        
        titleLabel.pin.topCenter(5).height(30).width(100).margin(padding)
        previewTextLabel.pin.below(of: titleLabel, aligned: .left).height(30).width(of: titleLabel).margin(padding)
        fullTextButton.pin.below(of: previewTextLabel, aligned: .center).height(50).width(70).margin(padding)
        timeshampLabel.pin.bottomLeft(padding).height(30).width(50)
        likesCountLabel.pin.bottomRight(padding).height(30).width(50)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
