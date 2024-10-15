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
    //
    //    private lazy var topView: ProfileView = {
    //        let view = ProfileView(frame: .zero)
    //        return view
    //    }()
    
    //    private lazy var collectionView: UICollectionView = {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.scrollDirection = .horizontal
    //        layout.itemSize = CGSize(width: 200, height: 160)
    //        layout.minimumLineSpacing = 15
    //        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    //        collectionView.backgroundColor = .clear
    //        collectionView.dataSource = self
    //        collectionView.delegate = self
    //        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
    //        return collectionView
    //    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        setup()
        setupConstraints()
        
        configureCompositionLayout()
    }
    
    private func setup() {
        //        view.addSubview(topView)
        view.addSubview(collectionView)
        collectionView.register(ProfileViewCell.self, forCellWithReuseIdentifier: String(describing: ProfileViewCell.self))
        collectionView.register(PostFollowersViewCell.self, forCellWithReuseIdentifier: String(describing: PostFollowersViewCell.self))
        collectionView.register(EditProfileViewCell.self, forCellWithReuseIdentifier: String(describing: EditProfileViewCell.self))
        collectionView.register(BarViewCell.self, forCellWithReuseIdentifier: String(describing: BarViewCell.self))
    }
    
    private func setupConstraints() {
        collectionView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            switch sectionIndex {
            case 0:
                return self?.ProfileInfoLayout()
            case 1:
                return self?.PostFollowersLayout()
            case 2:
                return self?.EditProfileLayout()
            case 3:
                return self?.BarProfileLayout()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    private func ProfileInfoLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func PostFollowersLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 25,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func EditProfileLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 20,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func BarProfileLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 0,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func defaultLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
}


extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else {
        //            return UICollectionViewCell()
        //        }
        //        let profileData = profileItems[indexPath.item]
        //        cell.configure(with: profileData)
        //        return cell
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProfileViewCell.self), for: indexPath) as! ProfileViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PostFollowersViewCell.self), for: indexPath) as! PostFollowersViewCell
            let profileData = profileItems[indexPath.item]
            cell.configure(with: profileData)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EditProfileViewCell.self), for: indexPath) as! EditProfileViewCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BarViewCell.self), for: indexPath) as! BarViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
