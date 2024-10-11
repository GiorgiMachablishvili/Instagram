//
//  MainBottomButtonView.swift
//  Instagram
//
//  Created by Gio's Mac on 10.10.24.
//

import UIKit
import SnapKit

class MainBottomButtonView: UIView {
    
    weak var delegate: MainViewController?
    
    private var selectedButton: UIButton?
    
    lazy var homeButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "house"), for: .normal)
        view.tintColor = UIColor.black
        view.addTarget(self, action: #selector(pressHomeButton), for: .touchUpInside)
        return view
    }()
    
    lazy var searchButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.tintColor = UIColor.black
        view.addTarget(self, action: #selector(pressSearchButton), for: .touchUpInside)
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "plus.app"), for: .normal)
        view.tintColor = UIColor.black
        view.addTarget(self, action: #selector(pressPlusButton), for: .touchUpInside)
        return view
    }()
    
    lazy var videoButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "video"), for: .normal)
        view.tintColor = UIColor.black
        view.addTarget(self, action: #selector(pressVideoButton), for: .touchUpInside)
        return view
    }()
    
    lazy var profileButton: UIButton = {
        let view = UIButton(type: .system)
        view.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
        view.tintColor = UIColor.black
        view.addTarget(self, action: #selector(pressProfileButton), for: .touchUpInside)
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
    
    private func resetButtonImages() {
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        plusButton.setImage(UIImage(systemName: "plus.app"), for: .normal)
        videoButton.setImage(UIImage(systemName: "video"), for: .normal)
        profileButton.setImage(UIImage(systemName: "person.crop.circle"), for: .normal)
    }
    
    // MARK: - Button Action Methods
    @objc private func pressHomeButton() {
        resetButtonImages() // Reset all buttons
        homeButton.setImage(UIImage(systemName: "house.fill"), for: .normal) // Set home button to filled state
        selectedButton = homeButton // Update selected button
        delegate?.pressHomeButton()
    }
    
    @objc private func pressSearchButton() {
        resetButtonImages()
        searchButton.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        selectedButton = searchButton
        delegate?.pressSearchButton()
    }
    
    @objc private func pressPlusButton() {
        resetButtonImages()
        plusButton.setImage(UIImage(systemName: "plus.app.fill"), for: .normal)
        selectedButton = plusButton
        delegate?.pressPlusButton()
    }
    
    @objc private func pressVideoButton() {
        resetButtonImages()
        videoButton.setImage(UIImage(systemName: "video.fill"), for: .normal)
        selectedButton = videoButton
        delegate?.pressVideoButton()
    }
    
    @objc private func pressProfileButton() {
        resetButtonImages()
        profileButton.setImage(UIImage(systemName: "person.crop.circle.fill"), for: .normal)
        selectedButton = profileButton
        delegate?.pressProfileButton()
    }
    
}
