//
//  ProfileViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 15.10.24.
//

import UIKit
import SnapKit
import FirebaseAuth

class ProfileViewCell: UICollectionViewCell {
    private lazy var nameButton: UIButton = {
        let view = UIButton(type: .system)
                
        // Create the left image
        let leftImageView = UIImageView(image: UIImage(systemName: "bag"))
        leftImageView.contentMode = .scaleAspectFit
        leftImageView.tintColor = .black
                
        // Create the right image
        let rightImageView = UIImageView(image: UIImage(systemName: "arrow.down"))
        rightImageView.contentMode = .scaleAspectFit
        rightImageView.tintColor = .black
         
        // Create a label for the button title
        let titleLabel = UILabel()
        if let user = Auth.auth().currentUser {
            let userName = user.displayName ?? "User"
            titleLabel.text = userName
        } else {
            titleLabel.text = "Welcome"
        }
        // Create a horizontal stack view to hold the images and title
        let hStack = UIStackView(arrangedSubviews: [leftImageView, titleLabel, rightImageView])
        hStack.axis = .horizontal
        hStack.spacing = 5
        hStack.alignment = .center
        view.addSubview(hStack)
        
        hStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        return view
    }()
    
    private lazy var threadsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "threads"), for: .normal)
        view.contentMode = .scaleAspectFill
        view.tintColor = .black
        return view
    }()
    
    private lazy var addButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "plusIcon"), for: .normal)
        view.contentMode = .scaleAspectFill
        view.tintColor = .black
        return view
    }()
    
    private lazy var menuButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "menuIcon"), for: .normal)
        view.contentMode = .scaleAspectFill
        view.tintColor = .black
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(nameButton)
        addSubview(addButton)
        addSubview(menuButton)
        addSubview(threadsButton)
    }
    
    private func setupConstraint() {
        nameButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        
        threadsButton.snp.remakeConstraints { make in
            make.centerY.equalTo(nameButton.snp.centerY)
            make.trailing.equalTo(addButton.snp.leading).offset(-30)
            make.height.width.equalTo(25)
        }
        
        addButton.snp.remakeConstraints { make in
            make.centerY.equalTo(nameButton.snp.centerY)
            make.trailing.equalTo(menuButton.snp.leading).offset(-30)
            make.height.width.equalTo(25)
        }
        
        menuButton.snp.remakeConstraints { make in
            make.centerY.equalTo(nameButton.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-30)
            make.height.width.equalTo(25)
        }
    }
}
