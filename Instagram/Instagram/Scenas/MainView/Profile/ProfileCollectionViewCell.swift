//
//  ProfileCollectionViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 13.10.24.
//

import UIKit
import SnapKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    
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
        
        //        // Create attributes for the number (top line)
        //        let numberAttributes: [NSAttributedString.Key: Any] = [
        //            .font: UIFont.boldSystemFont(ofSize: 24),
        //            .foregroundColor: UIColor.black
        //        ]
        //
        //        // Create attributes for the text "followers" (bottom line)
        //        let textAttributes: [NSAttributedString.Key: Any] = [
        //            .font: UIFont.systemFont(ofSize: 16),
        //            .foregroundColor: UIColor.gray
        //        ]
        //
        //        // Create an attributed string combining both
        //        let attributedText = NSMutableAttributedString(string: "25\n", attributes: numberAttributes)
        //        let textLine = NSAttributedString(string: "followers", attributes: textAttributes)
        //        attributedText.append(textLine)
        //
        //        // Set the attributed text to the label
        //        view.attributedText = attributedText
        //
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
    
    private lazy var editProfileButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Edit profile", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var shareProfileButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Share profile", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var discoverPeopleButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(systemName: "person.badge.plus"), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var postButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "grid"), for: .normal)
        view.tintColor = .black
        view.imageView?.contentMode = .scaleAspectFill
        view.imageView?.clipsToBounds = true
        view.addTarget(self, action: #selector(pressPostButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var shareMomentsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "video_unselected"), for: .normal)
        view.tintColor = .black
        view.layer.cornerRadius = 8
        view.imageView?.contentMode = .scaleAspectFill
        view.imageView?.clipsToBounds = true
        view.addTarget(self, action: #selector(pressShareMomentsButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var userPhotosAndVideosButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "profile_selected"), for: .normal)
        view.tintColor = .black
        view.layer.cornerRadius = 8
        view.imageView?.contentMode = .scaleAspectFill
        view.imageView?.clipsToBounds = true
        view.addTarget(self, action: #selector(pressUserPhotosAndVideosButton), for: .touchUpInside)
        return view
    }()
    
    private lazy var lineImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "LineImage")
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
        addSubview(editProfileButton)
        addSubview(shareProfileButton)
        addSubview(discoverPeopleButton)
        addSubview(postButton)
        addSubview(shareMomentsButton)
        addSubview(userPhotosAndVideosButton)
        addSubview(lineImage)
        
    }
    
    private func setupConstraints() {
        userImage.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(40)
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
        
        editProfileButton.snp.remakeConstraints { make in
            make.top.equalTo(userName.snp.bottom).offset(15)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(35)
            make.width.equalTo(150)
        }
        
        shareProfileButton.snp.remakeConstraints { make in
            make.centerY.equalTo(editProfileButton.snp.centerY)
            make.leading.equalTo(editProfileButton.snp.trailing).offset(12)
            make.height.equalTo(35)
            make.width.equalTo(150)
        }
        
        discoverPeopleButton.snp.remakeConstraints { make in
            make.centerY.equalTo(editProfileButton.snp.centerY)
            make.leading.equalTo(shareProfileButton.snp.trailing).offset(12)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        postButton.snp.remakeConstraints { make in
            make.top.equalTo(editProfileButton.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(50)
            make.width.height.equalTo(50)
        }
        
        shareMomentsButton.snp.remakeConstraints { make in
            make.centerY.equalTo(postButton.snp.centerY)
            make.leading.equalTo(postButton.snp.trailing).offset(70)
            make.width.height.equalTo(30)
        }
        
        userPhotosAndVideosButton.snp.remakeConstraints { make in
            make.centerY.equalTo(postButton.snp.centerY)
            make.leading.equalTo(shareMomentsButton.snp.trailing).offset(70)
            make.width.height.equalTo(50)
        }
        
        lineImage.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(postButton.snp.bottom)
            make.width.equalTo(120)
            make.height.equalTo(1)
        }
    }
    
    @objc func pushIt() {
        print("------------ yes")
    }
    
    @objc func pressPostButton() {
        print("Pressed Post Button")
        lineImage.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(postButton.snp.bottom)
            make.width.equalTo(120)
            make.height.equalTo(1)
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func pressShareMomentsButton() {
        print("Pressed Share Moments Button")
        lineImage.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(150)
            make.top.equalTo(postButton.snp.bottom)
            make.width.equalTo(120)
            make.height.equalTo(1)
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func pressUserPhotosAndVideosButton() {
        print("Pressed User Photos and Videos Button")
        lineImage.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(300)
            make.top.equalTo(postButton.snp.bottom)
            make.width.equalTo(120)
            make.height.equalTo(1)
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
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
