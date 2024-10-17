//
//  HowOtherCanInteractWithYouViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 18.10.24.
//

import UIKit
import SnapKit

class HowOtherCanInteractWithYouViewCell: UICollectionViewCell {
    private lazy var mainLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.text = "How other can interact with you"
        return view
    }()
    
    private lazy var messagesAndStoryRepliesButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(named: "messanger"),
            title: "Messages and story replies",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var tagsAndMentionsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(named: "threads"),
            title: "Tags and mentions",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var commentsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(named: "comments"),
            title: "Comments",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var sharingButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "arrow.down.left.arrow.up.right"),
            title: "Sharing",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var restrictedButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "circle.and.line.horizontal"),
            title: "Restricted",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var limitInteractionsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "circle.badge.exclamationmark"),
            title: "Limit interactions",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var hiddenWordsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "textformat"),
            title: "Hidden words",
            rightImage: UIImage(systemName: "chevron.forward")
        )
        return view
    }()
    
    private lazy var followAndInviteFriendsButton: CustomButton = {
        let view = CustomButton(
            leftImage: UIImage(systemName: "person.badge.plus"),
            title: "Follow and invite friends",
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
        addSubview(messagesAndStoryRepliesButton)
        addSubview(tagsAndMentionsButton)
        addSubview(commentsButton)
        addSubview(sharingButton)
        addSubview(restrictedButton)
        addSubview(limitInteractionsButton)
        addSubview(hiddenWordsButton)
        addSubview(followAndInviteFriendsButton)
    }
    
    private func setupConstraint() {
        mainLabel.snp.remakeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(snp.leading).inset(10)
            make.height.equalTo(25)
        }
        messagesAndStoryRepliesButton.snp.remakeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        tagsAndMentionsButton.snp.remakeConstraints { make in
            make.top.equalTo(messagesAndStoryRepliesButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        commentsButton.snp.remakeConstraints { make in
            make.top.equalTo(tagsAndMentionsButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        sharingButton.snp.remakeConstraints { make in
            make.top.equalTo(commentsButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        restrictedButton.snp.remakeConstraints { make in
            make.top.equalTo(sharingButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        limitInteractionsButton.snp.remakeConstraints { make in
            make.top.equalTo(restrictedButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        hiddenWordsButton.snp.remakeConstraints { make in
            make.top.equalTo(limitInteractionsButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
        followAndInviteFriendsButton.snp.remakeConstraints { make in
            make.top.equalTo(hiddenWordsButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(350 * Constraint.xCoeff)
        }
    }
}
