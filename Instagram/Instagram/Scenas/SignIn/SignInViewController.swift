//
//  SignInViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    private var viewModel = SignInViewModel()
    
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
    
    private let emailTextField = MyTextFieldView(placeholder: "Email", font: UIFont.KoronaOneRegular(size: 15))
    
    private let passwordTextField = MyTextFieldView(placeholder: "Password", font: UIFont.KoronaOneRegular(size: 15), isSecured: true, hasPasswordVisibility: true)
    
    private lazy var logInButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Login", for: .normal)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 8
        view.addTarget(self, action: #selector(pressLoginButton), for: .touchUpInside)
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
        view.addTarget(self, action: #selector(pressSignUpButton), for: .touchUpInside)
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
            make.width.equalTo(250)
            make.height.equalTo(80 * Constraint.yCoeff)
        }
        
        emailTextField.snp.remakeConstraints { make in
            make.top.equalTo(instaView.snp.bottom).offset(30 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(20 * Constraint.xCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-10 * Constraint.xCoeff)
            make.height.equalTo(40 * Constraint.yCoeff)
        }
        
        passwordTextField.snp.remakeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(30 * Constraint.yCoeff)
            make.leading.equalToSuperview().offset(20 * Constraint.xCoeff)
            make.trailing.equalTo(view.snp.trailing).offset(-10 * Constraint.xCoeff)
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
    
    @objc private func pressLoginButton () {
        viewModel.pressSignInButton(email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { result in
            switch result {
            case .success(let success):
                let mainVC = MainViewController()
                self.navigationController?.pushViewController(mainVC, animated: true)
            case .failure(let error):
                self.handleLoginError(error)
            }
        }
    }
    
    private func handleLoginError(_ error: SignInViewModel.SignInError) {
        switch error {
        case .email:
            let alert = UIAlertController(title: "Sign Up Failed", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .password:
            let alert = UIAlertController(title: "Sign Up Failed", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .auth(let string):
            let alert = UIAlertController(
                title: "Sign In Failed",
                message: error.localizedDescription,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc private func pressSignUpButton() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}

