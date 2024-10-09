//
//  SignInViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    private lazy var mainImageButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "uploadImage"), for: .normal)
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.placeholder = "Email"
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var fullNameTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.placeholder = "Full Name"
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var userNameTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.placeholder = "User Name"
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.placeholder = "Password"
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var signupButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign Up", for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Already have an account?"
        view.textAlignment = .left
        view.font = UIFont.KoronaOneRegular(size: 8)
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign In", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        view.backgroundColor = .systemBackground
    }
    
    private func setup() {
        view.addSubview(mainImageButton)
        view.addSubview(emailTextField)
        view.addSubview(fullNameTextField)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signupButton)
        view.addSubview(questionLabel)
        view.addSubview(signInButton)
    }
    
    private func setupConstraints() {
        mainImageButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.height.width.equalTo(200 * Constraint.yCoeff)
        }
        
        emailTextField.snp.remakeConstraints { make in
            make.top.equalTo(mainImageButton.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        fullNameTextField.snp.remakeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        userNameTextField.snp.remakeConstraints { make in
            make.top.equalTo(fullNameTextField.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        passwordTextField.snp.remakeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(10 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        signupButton.snp.remakeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(270 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        questionLabel.snp.remakeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-25 * Constraint.yCoeff)
            make.leading.equalTo(view.snp.leading).offset(100 * Constraint.xCoeff)
            make.height.equalTo(10 * Constraint.yCoeff)
        }
        
        signInButton.snp.remakeConstraints { make in
            make.centerY.equalTo(questionLabel.snp.centerY)
            make.leading.equalTo(questionLabel.snp.trailing).offset(5 * Constraint.xCoeff)
            make.height.equalTo(10 * Constraint.yCoeff)
        }
    }
}
