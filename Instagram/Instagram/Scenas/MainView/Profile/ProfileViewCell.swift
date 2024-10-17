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
    
    weak var delegate: ProfileViewCellDelegate?
    private lazy var nameButton: CustomButton = {
        let userName: String
        if let user = Auth.auth().currentUser {
            userName = user.displayName ?? "User"
        } else {
            userName = "Welcome"
        }
        
        let view = CustomButton(
            leftImage: UIImage(systemName: "bag"),
            title: userName,
            rightImage: UIImage(systemName: "arrow.down")
        )
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
        view.addTarget(self, action: #selector(pressedMenuBar), for: .touchUpInside)
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
            make.height.equalTo(50 * Constraint.yCoeff)
            make.width.equalTo(200 * Constraint.xCoeff)
        }
        
        threadsButton.snp.remakeConstraints { make in
            make.centerY.equalTo(nameButton.snp.centerY)
            make.trailing.equalTo(addButton.snp.leading).offset(-30 * Constraint.xCoeff)
            make.height.width.equalTo(25 * Constraint.yCoeff)
        }
        
        addButton.snp.remakeConstraints { make in
            make.centerY.equalTo(nameButton.snp.centerY)
            make.trailing.equalTo(menuButton.snp.leading).offset(-30 * Constraint.xCoeff)
            make.height.width.equalTo(25 * Constraint.yCoeff)
        }
        
        menuButton.snp.remakeConstraints { make in
            make.centerY.equalTo(nameButton.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-30 * Constraint.xCoeff)
            make.height.width.equalTo(25 * Constraint.yCoeff)
        }
    }
    
    @objc func pressedMenuBar() {
        delegate?.didPressMenuButton()
    }
}
