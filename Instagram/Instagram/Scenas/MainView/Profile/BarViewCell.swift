//
//  BarViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 15.10.24.
//

import UIKit
import SnapKit

class BarViewCell: UICollectionViewCell {
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
        addSubview(postButton)
        addSubview(shareMomentsButton)
        addSubview(userPhotosAndVideosButton)
        addSubview(lineImage)
    }
    
    private func setupConstraints() {
        postButton.snp.remakeConstraints { make in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(snp.leading).offset(40 * Constraint.xCoeff)
            make.width.height.equalTo(50 * Constraint.yCoeff)
            
        }
        
        shareMomentsButton.snp.remakeConstraints { make in
            make.centerY.equalTo(postButton.snp.centerY)
            make.centerX.equalTo(snp.centerX)
            make.width.height.equalTo(30 * Constraint.yCoeff)
        }
        
        userPhotosAndVideosButton.snp.remakeConstraints { make in
            make.centerY.equalTo(postButton.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-40 * Constraint.xCoeff)
            make.width.height.equalTo(50 * Constraint.yCoeff)
        }
        
        lineImage.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(postButton.snp.bottom).offset(1)
            make.width.equalTo(120 * Constraint.xCoeff)
            make.height.equalTo(1)
        }
    }
    
    @objc func pressPostButton() {
        print("Pressed Post Button")
        lineImage.snp.remakeConstraints { make in
            make.centerX.equalTo(postButton.snp.centerX)
            make.top.equalTo(postButton.snp.bottom)
            make.width.equalTo(130 * Constraint.xCoeff)
            make.height.equalTo(1)
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func pressShareMomentsButton() {
        print("Pressed Share Moments Button")
        lineImage.snp.remakeConstraints { make in
            make.centerX.equalTo(shareMomentsButton.snp.centerX)
            make.top.equalTo(postButton.snp.bottom)
            make.width.equalTo(130 * Constraint.xCoeff)
            make.height.equalTo(1)
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func pressUserPhotosAndVideosButton() {
        print("Pressed User Photos and Videos Button")
        lineImage.snp.remakeConstraints { make in
            make.centerX.equalTo(userPhotosAndVideosButton.snp.centerX)
            make.top.equalTo(postButton.snp.bottom)
            make.width.equalTo(130 * Constraint.xCoeff)
            make.height.equalTo(1)
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}
