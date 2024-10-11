//
//  MyTextFiledView.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit
import SnapKit

class MyTextFieldView: UIView {
    // Only textField and visibilityToggleButton, no label.
    private lazy var textField: UITextField = {
        let view = UITextField(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray6
        view.placeholder = placeholderText
        return view
    }()
    
    private lazy var visibilityToggleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .gray
        button.isHidden = true
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    
    private var isSecured: Bool = false
    private var placeholderText: String?
    
    var text: String {
        get {
            textField.text ?? ""
        }
        set {
            textField.text = newValue
        }
    }
    
    public var inputTextField: UITextField {
        return textField
    }
    
    init(
        placeholder: String? = nil,
        font: UIFont = UIFont.KoronaOneRegular(size: 15),
        isSecured: Bool = false,
        hasPasswordVisibility: Bool = false
    ) {
        super.init(frame: .zero)
        
        self.isSecured = isSecured
        self.placeholderText = placeholder
        
        setupHierarchy()
        setupConstraints()
        
        textField.isSecureTextEntry = isSecured
        visibilityToggleButton.isHidden = !hasPasswordVisibility
        
        if hasPasswordVisibility {
            setupPasswordVisibilityToggle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(textField)
        addSubview(visibilityToggleButton)
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
    
    func clearText() {
        textField.text = ""
    }
    
    private func setupConstraints() {
        visibilityToggleButton.snp.makeConstraints { make in
            make.centerY.equalTo(textField.snp.centerY)
            make.trailing.equalTo(self.snp.trailing).offset(-5 * Constraint.xCoeff)
            make.width.height.equalTo(22 * Constraint.xCoeff)
        }
        
        textField.snp.remakeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(15 * Constraint.xCoeff)
            make.trailing.equalTo(visibilityToggleButton.snp.leading).offset(-5 * Constraint.xCoeff)
            make.top.bottom.equalTo(self)
        }
    }
    
    private func setupPasswordVisibilityToggle() {
        textField.rightView = visibilityToggleButton
        textField.rightViewMode = .always
    }
    
    @objc private func togglePasswordVisibility() {
        isSecured.toggle()
        textField.isSecureTextEntry = isSecured
        let imageName = isSecured ? "eye.slash" : "eye"
        visibilityToggleButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
