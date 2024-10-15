//
//  EditProfileViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 15.10.24.
//

import UIKit
import SnapKit

class EditProfileViewCell: UICollectionViewCell {
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(editProfileButton)
        addSubview(shareProfileButton)
        addSubview(discoverPeopleButton)
    }
    
    private func setupConstraints() {
        editProfileButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.bottom)
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
    }
}
