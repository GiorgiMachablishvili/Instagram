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
    }
    
    private func setupConstraints() {
        logoImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(170)
            make.width.equalTo(200)
        }
    }
}
