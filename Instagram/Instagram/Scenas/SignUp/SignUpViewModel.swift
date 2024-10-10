//
//  SignUpViewModel.swift
//  Instagram
//
//  Created by Gio's Mac on 10.10.24.
//

import UIKit

class SignUpViewModel {
    private let authManager = FireBaseManager.shared
    
    var user = User(email: "", fullName: "", userName: "", password: "")
    
    var emailAlarmMessage: String?
    var fullNameAlarmMessage: String?
    var userNameAlarmMessage: String?
    var passwordAlarmMessage: String?
    
    func didPressSignInButton(
        email: String?,
        fullName: String?,
        userName: String?,
        passWord: String?,
        image: UIImage?,
        completion: @escaping (Result<Void, SignUpError>) -> Void
    ) {
        user.email = email ?? ""
        user.fullName = fullName ?? ""
        user.userName = userName ?? ""
        user.password = passWord ?? ""
        
        // Validate fields
        
        guard validateEmail() else {
            completion(.failure(.email))
            return
        }
        
        guard validateFullName() else {
            completion(.failure(.fullName))
            return
        }
        
        guard validateUserName() else {
            completion(.failure(.userName))
            return
        }
        
        guard validatePassword() else {
            completion(.failure(.password))
            return
        }
        
        guard let validImage = image else {
            completion(.failure(.auth("Profile image is missing.")))
            return
        }
        
        //MARK: If all validations pass, proceed with account creation
        authManager.createAccount(withEmail: user.email, password: user.password, name: user.fullName, image: validImage) { error in
            if let error = error {
                completion(.failure(.auth(error.localizedDescription)))
            } else {
                completion(.success(()))
            }
        }
    }
    
    //MARK: Input validation
    
    func validateEmail() -> Bool {
        if user.email.isEmpty {
            emailAlarmMessage = "Enter email address."
            
            return false
        }
        if !isValidEmail(user.email) {
            emailAlarmMessage = "Please enter a valid email address."
            return false
        }
        emailAlarmMessage = nil
        return true
    }
    
    func validateFullName() -> Bool {
        if user.fullName.isEmpty {
            fullNameAlarmMessage = "Please enter some text"
            return false
        }
        if !isValidFullName(user.fullName) {
            fullNameAlarmMessage = "Please enter English letters"
            return false
        }
        fullNameAlarmMessage = nil
        return true
    }
    
    func validateUserName() -> Bool {
        if user.fullName.isEmpty {
            fullNameAlarmMessage = "Please enter some text"
            return false
        }
        if !isValidFullName(user.fullName) {
            fullNameAlarmMessage = "Please enter English letters"
            return false
        }
        fullNameAlarmMessage = nil
        return true
    }
    
    func validatePassword() -> Bool {
        if user.password.isEmpty {
            passwordAlarmMessage = "Please enter a password."
            return false
        }
        if user.password.count < 6 {
            passwordAlarmMessage = "Password should be more than 5 letters."
            return false
        }
        if !containsCapitalLetter(user.password) {
            passwordAlarmMessage = "Password should include at least one capital letter."
            return false
        }
        if !containsNumber(user.password) {
            passwordAlarmMessage = "Password should include at least one number."
            return false
        }
        passwordAlarmMessage = nil
        return true
    }
    
    // MARK: - Helper Methods
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidFullName(_ name: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: name)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    private func isValidUserName(_ name: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: name)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    private func containsCapitalLetter(_ password: String) -> Bool {
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let capitalLetterTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        return capitalLetterTest.evaluate(with: password)
    }
    
    private func containsNumber(_ password: String) -> Bool {
        let numberRegEx = ".*[0-9]+.*"
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
        return numberTest.evaluate(with: password)
    }
}

extension SignUpViewModel {
    enum SignUpError: Error {
        case email
        case fullName
        case userName
        case password
        case auth(String)
        
        var localizedDescription: String {
            switch self {
            case .email:
                return "Invalid email."
            case .fullName:
                return "Invalid full name."
            case .userName:
                return "Invalid user name."
            case .password:
                return "Invalid password."
            case .auth(let message):
                return "Authentication error: \(message)"
            }
        }
    }
}
