//
//  LaunchView.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit
import SnapKit

class LogoView: UIView {
    private lazy var logoImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "InstagramLogo")
        return view
    }()
    
//    private lazy var nameLabel: MyLabel = {
//        let view = MyLabel(frame: .zero)
//        view.font = UIFont.KoronaOneRegular(size: 20)
//        view.textAlignment = .center
//        view.text = "TRAVEL MEMORY"
//        return view
//    }()
//
//    private lazy var sloganLabel: MyLabel = {
//        let view = MyLabel(frame: .zero)
//        view.font = UIFont.KoronaOneRegular(size: 15)
//        view.textAlignment = .center
//        view.text = "JOURNAL"
//        return view
//    }()
    
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
        addSubview(logoImage)
//        addSubview(nameLabel)
//        addSubview(sloganLabel)
    }
    
    private func setupConstraints() {
        logoImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
//        nameLabel.snp.makeConstraints { make in
//            make.top.equalTo(logoImage.snp.bottom).offset(8)
//            make.leading.trailing.equalToSuperview().inset(20)
//        }
//
//        sloganLabel.snp.makeConstraints { make in
//            make.top.equalTo(nameLabel.snp.bottom).offset(4)
//            make.leading.trailing.equalToSuperview().inset(20)
//            make.bottom.equalToSuperview().offset(-20)
//        }
    }
}
