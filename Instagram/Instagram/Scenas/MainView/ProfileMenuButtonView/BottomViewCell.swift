//
//  BottomViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 18.10.24.
//

import UIKit
import SnapKit

class BottomViewCell: UICollectionViewCell {
    private lazy var loginButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Login", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private lazy var addAccountButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Add account", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    private lazy var logoutButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Log out", for: .normal)
        view.setTitleColor(.red, for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        addSubview(loginButton)
        addSubview(addAccountButton)
        addSubview(logoutButton)
    }
    
    private func setupConstraints() {
        loginButton.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
        }
        addAccountButton.snp.remakeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
        }
        logoutButton.snp.remakeConstraints { make in
            make.top.equalTo(addAccountButton.snp.bottom).offset(10)
            make.leading.equalTo(snp.leading).offset(10)
            make.height.equalTo(50 * Constraint.yCoeff)
        }
    }
}
