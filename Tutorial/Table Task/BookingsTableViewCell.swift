//
//  BookingsTableViewCell.swift
//  Tutorial
//
//  Created by Sange Sherpa on 07/08/2023.
//

import UIKit
import SnapKit

class BookingsTableViewCell: UITableViewCell {
    
    static let identifier = "BookingTableViewCell"
    
    var mainContainer: UIView = {
        var v = UIView()
        return v
    }()
    
    // MARK: UI Components
    var bookingImage: UIImageView = {
        var img = UIImageView()
        img.layer.cornerRadius = img.frame.width / 2
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.image = UIImage(systemName: "pencil")
        return img
    }()
    
    var orderedByLabel: UILabel = {
        var label = UILabel()
        label.text = "Ordered By"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    var orderDescription: UILabel = {
        var label = UILabel()
        label.text = "Ordered From"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    var dateLabel: UILabel = {
        var label = UILabel()
        label.text = "Date"
        label.font = .systemFont(ofSize: 13)
        return label
    }()

    var timeLabel: UILabel = {
        var label = UILabel()
        label.text = "Time"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    var statusBtn: UIButton = {
        var btn = UIButton()
        return btn
    }()
    
    var leftStack: UIStackView = {
       var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()

    var rightStack: UIStackView = {
       var stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    

    // MARK: Main Calling Method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(mainContainer)
        
        mainContainer.addSubview(leftStack)
        mainContainer.addSubview(rightStack)
        mainContainer.addSubview(bookingImage)
        mainContainer.addSubview(statusBtn)
        
        leftStack.addArrangedSubview(orderedByLabel)
        leftStack.addArrangedSubview(orderDescription)
        
        rightStack.addArrangedSubview(dateLabel)
        rightStack.addArrangedSubview(timeLabel)
        
        mainContainer.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        
        bookingImage.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        statusBtn.snp.makeConstraints { make in
            make.top.equalTo(rightStack.snp.bottom).offset(5)
            make.right.equalToSuperview()
        }
        
        leftStack.snp.makeConstraints { make in
            make.left.equalTo(bookingImage.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        rightStack.snp.makeConstraints { make in
            make.top.equalTo(leftStack.snp.top)
            make.right.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
