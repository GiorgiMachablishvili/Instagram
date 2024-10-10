//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import UIKit
import SnapKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    // ViewModel
    private var viewModel = SignUpViewModel()
    
    private lazy var mainImageButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setImage(UIImage(named: "plus_photo"), for: .normal)
        view.addTarget(self, action: #selector(pressMainImageButton), for: .touchUpInside)
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
        view.addTarget(self, action: #selector(clickSignUpButton), for: .touchUpInside)
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
        view.addTarget(self, action: #selector(pressSignInButton), for: .touchUpInside)
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
    
    @objc private func pressMainImageButton() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary // This allows the user to select an image from the photo library (or computer on simulator)
        imagePickerController.allowsEditing = true // This allows for the image to be cropped if needed
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc private func clickSignUpButton() {
        guard let selectedImage = mainImageButton.image(for: .normal) else {
            let alert = UIAlertController(title: "Error", message: "Please select a profile image.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        viewModel.didPressSignInButton(
            email: emailTextField.text,
            fullName: fullNameTextField.text,
            userName: userNameTextField.text,
            passWord: passwordTextField.text,
            image: selectedImage
        ) { [weak self] result in
            switch result {
            case.success:
                let signInVC = MainViewController()
                self?.navigationController?.pushViewController(signInVC, animated: true)
            case.failure(let error):
                self?.handleSignUpError(error)
            }
        }
    }
    
    private func handleSignUpError(_ error: SignUpViewModel.SignUpError) {
        switch error {
        case .email:
            let alert = UIAlertController(title: "Sign Up Failed", message: viewModel.emailAlarmMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .fullName:
            let alert = UIAlertController(title: "Sign Up Failed", message: viewModel.fullNameAlarmMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .userName:
            let alert = UIAlertController(title: "Sign Up Failed", message: viewModel.userNameAlarmMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .password:
            let alert = UIAlertController(title: "Sign Up Failed", message: viewModel.passwordAlarmMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case .auth(let message):
            let alert = UIAlertController(title: "Sign Up Failed", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc private func pressSignInButton() {
        let signInVC = SignInViewController()
        navigationController?.pushViewController(signInVC, animated: true)
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            mainImageButton.setImage(editedImage, for: .normal)
        } else if let originalImage = info[.originalImage] as? UIImage {
            mainImageButton.setImage(originalImage, for: .normal)
        }
        
        dismiss(animated: true, completion: nil) // Dismiss the image picker once the image is selected
    }
    
    // This method is called if the user cancels the image selection
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil) // Dismiss the picker if the user cancels
    }
}
