//
//  RegisterViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    private lazy var instaView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var mainLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 1
        view.textAlignment = .center
        view.text = "Instagram"
        view.font = UIFont.Billabong(size: 60)
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
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.placeholder = "Password"
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var logInButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Login", for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var questionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Dont have an account?"
        view.textAlignment = .left
        view.font = UIFont.KoronaOneRegular(size: 8)
        view.numberOfLines = 1
        return view
    }()
    
    private lazy var signUpButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Sign Up", for: .normal)
        view.setTitleColor(.blue, for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        view.backgroundColor = .systemBackground
        setupGradient()
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 252/255, green: 175/255, blue: 69/255, alpha: 1.0).cgColor,  // Orange
            UIColor(red: 245/255, green: 96/255, blue: 64/255, alpha: 1.0).cgColor,   // Red
            UIColor(red: 189/255, green: 55/255, blue: 147/255, alpha: 1.0).cgColor,  // Pink
            UIColor(red: 96/255, green: 55/255, blue: 245/255, alpha: 1.0).cgColor,   // Purple
            UIColor(red: 64/255, green: 96/255, blue: 252/255, alpha: 1.0).cgColor    // Blue
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = instaView.bounds
        instaView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        instaView.layer.sublayers?.first?.frame = instaView.bounds
    }
    
    
    private func setup() {
        view.addSubview(instaView)
        instaView.addSubview(mainLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
        view.addSubview(questionLabel)
        view.addSubview(signUpButton)
    }
    
    private func setupConstraints() {
        instaView.snp.remakeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(200 * Constraint.yCoeff)
        }
        
        mainLabel.snp.remakeConstraints { make in
            make.center.equalTo(instaView.snp.center)
            make.height.equalTo(80 * Constraint.yCoeff)
        }
        
        emailTextField.snp.remakeConstraints { make in
            make.top.equalTo(instaView.snp.bottom).offset(30 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        passwordTextField.snp.remakeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30 * Constraint.yCoeff)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(300 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        logInButton.snp.remakeConstraints { make in
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
        
        signUpButton.snp.remakeConstraints { make in
            make.centerY.equalTo(questionLabel.snp.centerY)
            make.leading.equalTo(questionLabel.snp.trailing).offset(5 * Constraint.xCoeff)
            make.height.equalTo(10 * Constraint.yCoeff)
        }
    }
}

