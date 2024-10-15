//
//  PostFollersViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 15.10.24.
//

import UIKit
import SnapKit

class PostFollowersViewCell: UICollectionViewCell {
    private lazy var userImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "plus_photo")
        return view
    }()
    
    private lazy var postLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var followersLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var followingLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    private lazy var userName: UILabel = {
        let view = UILabel(frame: .zero)
        view.textAlignment = .center
        view.backgroundColor = .systemGray6
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(userImage)
        addSubview(postLabel)
        addSubview(followersLabel)
        addSubview(followingLabel)
        addSubview(userName)
    }
    
    private func setupConstraints() {
        userImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading).offset(5)
            make.height.width.equalTo(100)
        }
        
        postLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(userImage.snp.centerY)
            make.leading.equalTo(userImage.snp.trailing).offset(15)
            make.height.equalTo(50)
        }
        
        followersLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(userImage.snp.centerY)
            make.leading.equalTo(postLabel.snp.trailing).offset(25)
            make.height.equalTo(50)
        }
        
        followingLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(userImage.snp.centerY)
            make.leading.equalTo(followersLabel.snp.trailing).offset(25)
            make.height.equalTo(50)
        }
        
        userName.snp.remakeConstraints { make in
            make.top.equalTo(userImage.snp.bottom).offset(15)
            make.leading.equalTo(snp.leading).offset(25)
            make.height.equalTo(20)
        }
    }
    
    func configure(with data: ProfileData) {
            userImage.image = data.userImage
            postLabel.text = data.posts
            followersLabel.text = data.followers
            followingLabel.text = data.following
            userName.text = data.userName
        }
}
