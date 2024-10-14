//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 11.10.24.
//

import UIKit
import SnapKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    private let profileItems: [ProfileData] = [
        .init(userImage: UIImage(systemName: "circle.square"), posts: "25\npost", followers: "12\nfollowers", following: "13" + "\n" + "following", userName: "Test user")
    ]
    
    private lazy var topView: ProfileView = {
        let view = ProfileView(frame: .zero)
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 160)
        layout.minimumLineSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        setup()
        setupConstraints()
    }
    
    private func setup() {
        view.addSubview(topView)
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        topView.snp.remakeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(70)
        }
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview()
        }
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else {
                   return UICollectionViewCell()
               }
        let profileData = profileItems[indexPath.item]
        cell.configure(with: profileData)
        return cell
    }
    
    
}
