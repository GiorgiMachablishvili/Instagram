//
//  MainBottomButtonView.swift
//  Instagram
//
//  Created by Gio's Mac on 10.10.24.
//

import UIKit
import SnapKit

class MainBottomButtonView: UIView {
    
    private let homeButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "home_unselected"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let searchButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "search_unselected"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let plusButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "plus_unselected"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let videoButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "video"), for: .normal)
        view.tintColor = UIColor.black
        return view
    }()
    
    private let profileButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(named: "profile_unselected"), for: .normal)
        view.tintColor = UIColor.black
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
        addSubview(homeButton)
        addSubview(searchButton)
        addSubview(plusButton)
        addSubview(videoButton)
        addSubview(profileButton)
    }
    
    private func setupConstraints() {
        homeButton.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(32)
            make.bottom.equalTo(snp.bottom).offset(-18)
            make.height.width.equalTo(56)
        }
        
        searchButton.snp.remakeConstraints { make in
            make.leading.equalTo(homeButton.snp.trailing).offset(10)
            make.centerY.equalTo(homeButton.snp.centerY)
            make.height.width.equalTo(59)
        }
        
        plusButton.snp.remakeConstraints { make in
            make.leading.equalTo(searchButton.snp.trailing).offset(10)
            make.centerY.equalTo(homeButton.snp.centerY)
            make.height.width.equalTo(70)
        }
        
        videoButton.snp.remakeConstraints { make in
            make.leading.equalTo(plusButton.snp.trailing).offset(10)
            make.centerY.equalTo(homeButton.snp.centerY)
            make.height.width.equalTo(49)
        }
        
        profileButton.snp.remakeConstraints { make in
            make.leading.equalTo(videoButton.snp.trailing).offset(10)
            make.centerY.equalTo(homeButton.snp.centerY)
            make.height.width.equalTo(50)
        }
    }
}
