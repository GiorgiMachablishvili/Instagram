//
//  CustomNavBarView.swift
//  Instagram
//
//  Created by Gio's Mac on 17.10.24.
//

import UIKit
import SnapKit

class CustomNavBarView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        return button
    }()
    
    init(hasBackButton: Bool = true) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        
        if hasBackButton {
            self.addSubview(backButton)
        }
        
        setupConstraints(hasBackButton: hasBackButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(hasBackButton: Bool) {
        self.snp.remakeConstraints { make in
            make.height.equalTo(100 * Constraint.yCoeff)
        }
        
        titleLabel.snp.remakeConstraints { make in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-10 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        if hasBackButton {
            backButton.snp.remakeConstraints { make in
                make.centerY.equalTo(titleLabel.snp.centerY)
                make.leading.equalTo(self.snp.leading).offset(20 * Constraint.xCoeff)
                make.width.height.equalTo(20 * Constraint.xCoeff)
            }
        }
    }
}
