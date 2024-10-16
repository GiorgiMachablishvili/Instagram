//
//  FireBaseManager.swift
//  Instagram
//
//  Created by Gio's Mac on 09.10.24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabaseInternal
import FirebaseStorage

class FireBaseManager {
    static let shared = FireBaseManager()
    private let fireStore = Firestore.firestore()
    
    
    //MARK: Init
    private init() {}
    
    //MARK: Methods
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    //MARK: Sign Out
    //    func signOut(completion: @escaping (Error?) -> Void) {
    //        do {
    //            try Auth.auth().signOut()
    //            completion(nil)
    //        } catch let signOutError as NSError {
    //            completion(signOutError)
    //        }
    //    }
    
    func signOut() async throws  {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            throw signOutError
        }
    }
}

//MARK: Account creation and sign in

extension FireBaseManager {
    //MARK: Create Acount
    
    /// Creat account
    /// - Parameters:
    ///   - email: email description
    ///   - password: password description
    ///   - name: name description
    ///   - completion: completion description
    /// - Example:
    /// ```
    /// authManager.createAccount(withEmail: user.email, password: user.password, name: user.fullName) { error in
    /// if let error = error {
    /// completion(.failure(.auth(error.localizedDescription)))
    /// } else {
    /// completion(.success(()))
    /// }
    ///
    func createAccount(withEmail email: String, password: String, name: String, image: UIImage, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error)
            } else if let user = authResult?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges { error in
                    completion(error)
                }
                Task {
                    do {
                        try await self.uploadImage(image, forUser: user.uid)
                        completion(nil)
                    } catch let uploadError {
                        completion(uploadError)
                    }
                }
            } else {
                completion(nil)
            }
        }
    }
    
    func uploadImage(_ image: UIImage, forUser userId: String) async throws {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        let storageRef = Storage.storage().reference().child("profile_images/\(userId).jpg")
        let _ = try await storageRef.putDataAsync(imageData, metadata: nil)
    }
    
    //MARK: Sign In With Email and Password
    
    //-Parameters
    //-email
    //-password
    //-name
    //-completion
    
    func signInWithEmail(withEmail email: String, password: String, name: String, completion: @escaping(Error?, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(error, nil)
            } else if let user = authResult?.user {
                let useName = user.displayName
                completion(error, nil)
            } else {
                completion(nil, nil)
            }
        }
    }
}

//extension FireBaseManager {
//    func fetchJournals(completion: @escaping ([Journal]) -> Void) {
//        guard let user = Auth.auth().currentUser else {
//            print("No user logged in")
//            completion([])
//            return
//        }
//
//        fireStore.collection("users").document(user.uid).collection("journals").getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error fetching journals: \(error.localizedDescription)")
//                completion([])
//            } else {
//                let journals = querySnapshot?.documents.compactMap { document -> Journal? in
//                    do {
//                        return try document.data(as: Journal.self)
//                    } catch {
//                        print("Error decoding journal: \(error)")
//                        return nil
//                    }
//                } ?? []
//
//                completion(journals)
//            }
//        }
//    }
//}


// MARK: Firestore
//extension FireBaseManager {
//    func uploadJournal(_ journal: Journal, completion: @escaping (Result<Void, Error>) -> Void) {
//        guard let user = Auth.auth().currentUser else {
//            completion(.failure(NSError(domain: "NoUserLoggedIn", code: 0, userInfo: [NSLocalizedDescriptionKey: "No user is logged in"])))
//            return
//        }
//
//        fireStore.collection("users").document(user.uid).collection("journals").document(journal.id).setData(journal.toDictionary()) { error in
//            if let error = error {
//                print("Error adding journal: \(error.localizedDescription)")
//                completion(.failure(error))
//            } else {
//                print("Journal successfully added for user: \(user.uid)")
//                completion(.success(()))
//            }
//        }
//    }
//}

extension FireBaseManager {
    func uploadImage(_ image: UIImage, path: String, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.6) else {
            completion(.failure(NSError(domain: "ImageUploader", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
            return
        }
        
        let storageRef = Storage.storage().reference()
        let imageRef = storageRef.child(path)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        imageRef.putData(imageData, metadata: metadata) { (metadata, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            imageRef.downloadURL { (url, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let downloadURL = url {
                    completion(.success(downloadURL))
                } else {
                    completion(.failure(NSError(domain: "ImageUploader", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])))
                }
            }
        }
    }
}
