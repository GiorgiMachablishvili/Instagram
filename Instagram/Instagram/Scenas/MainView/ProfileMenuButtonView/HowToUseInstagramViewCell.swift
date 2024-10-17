//
//  HowToUseInstagramViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 17.10.24.
//

import UIKit
import SnapKit

class HowToUseInstagramViewCell: UICollectionViewCell {
    private lazy var mainLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.text = "How to use instagram"
        return view
    }()
    
    private lazy var savedButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(named: "ribbon"),
            title: "Saved",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var archiveButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "timer"),
            title: "Archive",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var yourActivityButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "bolt.horizontal"),
            title: "Your activity",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var notificationButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "bell"),
            title: "Notification",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var timeManagementButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "bell"),
            title: "Time management",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraint()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(mainLabel)
        addSubview(savedButton)
        addSubview(archiveButton)
        addSubview(yourActivityButton)
        addSubview(notificationButton)
        addSubview(timeManagementButton)
    }
    
    private func setupConstraint() {
        mainLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(snp.leading).inset(10)
            make.height.equalTo(25)
        }
        savedButton.snp.remakeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        archiveButton.snp.remakeConstraints { make in
            make.top.equalTo(savedButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        yourActivityButton.snp.remakeConstraints { make in
            make.top.equalTo(archiveButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        notificationButton.snp.remakeConstraints { make in
            make.top.equalTo(yourActivityButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        timeManagementButton.snp.remakeConstraints { make in
            make.top.equalTo(notificationButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
    }
}
