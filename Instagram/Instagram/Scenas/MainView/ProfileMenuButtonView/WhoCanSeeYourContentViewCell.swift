//
//  WhoCanSeeYourContentViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 18.10.24.
//

import UIKit
import SnapKit

class WhoCanSeeYourContentViewCell: UICollectionViewCell {
    private lazy var mainLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.text = "Who can see your content"
        return view
    }()
    
    private lazy var accountPrivacyButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "lock"),
            title: "Account privacy",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var closeFriendsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "star.circle"),
            title: "Close friends",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var blockedButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "circle.slash"),
            title: "Blocked",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var hideStoryAndLiveButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "circle.dotted"),
            title: "Hide story and live",
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
        addSubview(accountPrivacyButton)
        addSubview(closeFriendsButton)
        addSubview(blockedButton)
        addSubview(hideStoryAndLiveButton)
    }
    
    private func setupConstraint() {
        mainLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(snp.leading).inset(10)
            make.height.equalTo(25)
        }
        accountPrivacyButton.snp.remakeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        closeFriendsButton.snp.remakeConstraints { make in
            make.top.equalTo(accountPrivacyButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        blockedButton.snp.remakeConstraints { make in
            make.top.equalTo(closeFriendsButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        hideStoryAndLiveButton.snp.remakeConstraints { make in
            make.top.equalTo(blockedButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
    }
}
