//
//  ProfileMenuViewController.swift
//  Instagram
//
//  Created by Gio's Mac on 17.10.24.
//

import UIKit
import SnapKit

class ProfileMenuViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        view.showsVerticalScrollIndicator = false
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear
        view.allowsSelection = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        setupConstraints()
        configureCompositionLayout()
        setupNavigationView()
        view.backgroundColor = .systemGray5
    }
    
    private func setup() {
        view.addSubview(collectionView)
        collectionView.register(AccountsCenterViewCell.self, forCellWithReuseIdentifier: String(describing: AccountsCenterViewCell.self))
        collectionView.register(HowToUseInstagramViewCell.self, forCellWithReuseIdentifier: String(describing: HowToUseInstagramViewCell.self))
        collectionView.register(WhoCanSeeYourContentViewCell.self, forCellWithReuseIdentifier: String(describing: WhoCanSeeYourContentViewCell.self))
        collectionView.register(HowOtherCanInteractWithYouViewCell.self, forCellWithReuseIdentifier: String(describing: HowOtherCanInteractWithYouViewCell.self))
        collectionView.register(WhatYouSeeViewCell.self, forCellWithReuseIdentifier: String(describing: WhatYouSeeViewCell.self))
        collectionView.register(YourAppAndMediaViewCell.self, forCellWithReuseIdentifier: String(describing: YourAppAndMediaViewCell.self))
        collectionView.register(ForFamilyViewCell.self, forCellWithReuseIdentifier: String(describing: ForFamilyViewCell.self))
        collectionView.register(ForProfessionalsViewCell.self, forCellWithReuseIdentifier: String(describing: ForProfessionalsViewCell.self))
        collectionView.register(BottomViewCell.self, forCellWithReuseIdentifier: String(describing: BottomViewCell.self))
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
                return self?.AccountCenterLayout()
            case 1:
                return self?.HowToUseInstagramLayout()
            case 2:
                return self?.WhoToSeeYourContentLayout()
            case 3:
                return self?.WhoOthersCanInteractWithYouLayout()
            case 4:
                return self?.WhatYouSeeLayout()
            case 5:
                return self?.YourAppAndMediaLayout()
            case 6:
                return self?.ForFamilyLayout()
            case 7:
                return self?.ForProfessionalsLayout()
            case 8:
                return self?.BottomViewLayout()
            default:
                return self?.defaultLayout()
            }
        }
        self.collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func AccountCenterLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(250)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(250)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 35,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func HowToUseInstagramLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(350)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(350)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func WhoToSeeYourContentLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func WhoOthersCanInteractWithYouLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(550)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(550)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func WhatYouSeeLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(300)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func YourAppAndMediaLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(450)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(450)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func ForFamilyLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(100)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func ForProfessionalsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(170)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(170)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func BottomViewLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(250)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(250)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 5,
            leading: 2,
            bottom: 2,
            trailing: 2
        )
        return section
    }
    
    private func defaultLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
    }
    
    private func setupNavigationView() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let customNavBar = CustomNavBarView(hasBackButton: true)
        
        customNavBar.titleLabel.text = "Setting and Activity"
        customNavBar.titleLabel.textColor = .black
        customNavBar.tintColor = .black
//        customNavBar.backgroundColor = .red
        
        view.addSubview(customNavBar)
        
        customNavBar.snp.remakeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
        customNavBar.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProfileMenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
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
        case 4:
            return 1
        case 5:
            return 1
        case 6:
            return 1
        case 7:
            return 1
        case 8:
            return 1
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AccountsCenterViewCell.self), for: indexPath) as! AccountsCenterViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HowToUseInstagramViewCell.self), for: indexPath) as! HowToUseInstagramViewCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: WhoCanSeeYourContentViewCell.self), for: indexPath) as! WhoCanSeeYourContentViewCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HowOtherCanInteractWithYouViewCell.self), for: indexPath) as! HowOtherCanInteractWithYouViewCell
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: WhatYouSeeViewCell.self), for: indexPath) as! WhatYouSeeViewCell
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: YourAppAndMediaViewCell.self), for: indexPath) as! YourAppAndMediaViewCell
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ForFamilyViewCell.self), for: indexPath) as! ForFamilyViewCell
            return cell
        case 7:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ForProfessionalsViewCell.self), for: indexPath) as! ForProfessionalsViewCell
            return cell
        case 8:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BottomViewCell.self), for: indexPath) as! BottomViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}





