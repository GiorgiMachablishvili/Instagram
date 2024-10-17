//
//  AccountsCenterViewCell.swift
//  Instagram
//
//  Created by Gio's Mac on 17.10.24.
//

import UIKit
import SnapKit

class AccountsCenterViewCell: UICollectionViewCell {
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.placeholder = "Search"
        view.layer.cornerRadius = 6
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var yourAccountLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 10)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.text = "Your account"
        return view
    }()
    
    private lazy var metaImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "meta")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var accountView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var accountImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(systemName: "person.crop.circle")
        view.tintColor = .black
        return view
    }()
    
    private lazy var accountCenterLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.text = "Account Center"
        return view
    }()
    
    private lazy var accountCenterInfoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.numberOfLines = 2
        view.text = "Password, security, personal details, ad preferences"
        return view
    }()
    
    private lazy var arrowImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(systemName: "chevron.forward")
        view.tintColor = .black
        return view
    }()
    
    private lazy var accountCenterBottomLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 10)
        view.textColor = .systemGray3
        view.textAlignment = .left
        view.numberOfLines = 2
        view.text = "Manage your connection experiences and account setting across Meta technologies"
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
        addSubview(searchBar)
        addSubview(yourAccountLabel)
        addSubview(metaImage)
        addSubview(accountView)
        accountView.addSubview(accountImage)
        accountView.addSubview(accountCenterLabel)
        accountView.addSubview(accountCenterInfoLabel)
        accountView.addSubview(arrowImage)
        addSubview(accountCenterBottomLabel)
    }
    
    private func setupConstraint() {
        searchBar.snp.remakeConstraints { make in
            make.top.equalTo(snp.top).offset(10 * Constraint.yCoeff)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(2 * Constraint.xCoeff)
        }
        yourAccountLabel.snp.remakeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(25)
            make.leading.equalTo(snp.leading).offset(10)
        }
        metaImage.snp.remakeConstraints { make in
            make.centerY.equalTo(yourAccountLabel.snp.centerY)
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.height.equalTo(15)
            make.width.equalTo(45)
        }
        accountView.snp.remakeConstraints { make in
            make.top.equalTo(yourAccountLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        accountImage.snp.remakeConstraints { make in
            make.top.equalTo(accountView.snp.top).offset(10)
            make.leading.equalTo(accountView.snp.leading).offset(10)
            make.height.width.equalTo(30)
        }
        accountCenterLabel.snp.remakeConstraints { make in
            make.top.equalTo(accountView.snp.top).offset(10)
            make.leading.equalTo(accountImage.snp.trailing).offset(7)
        }
        accountCenterInfoLabel.snp.remakeConstraints { make in
            make.top.equalTo(accountCenterLabel.snp.bottom).offset(4)
            make.leading.equalTo(accountImage.snp.trailing).offset(7)
            make.trailing.equalTo(arrowImage.snp.leading).offset(-7)
        }
        arrowImage.snp.remakeConstraints { make in
            make.top.equalTo(yourAccountLabel.snp.bottom).offset(35)
            make.trailing.equalTo(accountView.snp.trailing).offset(-10)
            make.width.height.equalTo(20)
        }
        accountCenterBottomLabel.snp.remakeConstraints { make in
            make.top.equalTo(accountView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
}
