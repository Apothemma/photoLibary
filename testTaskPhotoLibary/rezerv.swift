//
//  PhotoCollectionViewController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//
//


//import UIKit
//
//class PhotoCollectionViewController: UICollectionViewController {
//
//    var networkDataFetcher = NetworkDataFetcher()
//    private var timer: Timer?
//
//    private var photos = [UnsplashPhoto]()
//
//
//    private let itemsPerRow: CGFloat = 2
//    private let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView.backgroundColor = .white
//        setupCollectionView()
//        setupSearchBar()
//    }
//
//    private func setupCollectionView() {
////        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
//
//        collectionView.backgroundColor = .white
//
//        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
//
//    }
//
//    private func createLayout() -> UICollectionViewLayout {
//        for i in photos {
//            print(i.height)
//        }
//
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10)
//
//        let section = NSCollectionLayoutSection(group: group)
//        let leyout = UICollectionViewCompositionalLayout(section: section)
//        return leyout
//
//    }
//
//    private func setupSearchBar() {
//        let searchController = UISearchController()
//        navigationItem.searchController = searchController
//        searchController.searchBar.placeholder = "Поиск"
//        searchController.searchBar.delegate = self
//    }
//
//    // MARK: UICollectionViewDataSource, UICollectionViewDelegate
//    // kol-vo yacheek
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photos.count
//    }
//
//    // soderjimoe yacheyki po indexPath
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as! PhotoCell
//        let unspashPhoto = photos[indexPath.item]
//        cell.unspachPhot = unspashPhoto
//        return cell
//    }
//
//
//}
//
//
//// MARK: UISearchBarDelegate
//
//extension PhotoCollectionViewController: UISearchBarDelegate {
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
//            self.networkDataFetcher.fetchImages(searchTerm: searchText) { [weak self] (searchResults) in
//                guard let fetchedPhoto = searchResults else { return }
//                self?.photos = fetchedPhoto.results
//                self?.collectionView.reloadData()
//            }
//        })
//    }
//}
//
//
//
//
//// MARK: UICollectionViewDelegateFlowLayout
////
////
////extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let photo = photos[indexPath.item]
//////        let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
//////        let availableWidth = view.frame.width - paddingSpace
//////        let widthPerItem = availableWidth / itemsPerRow
//////        let height = CGFloat(photo.height) * ((view.frame.width - 31 ) / 2 ) / CGFloat(photo.width)
//////        return CGSize(width: widthPerItem, height: height)
////
//////        return CGSize(width: (view.frame.width - 31 ) / 2 , height: height)
////
////        let const = (view.frame.width - 31) / 15
////        let width = CGFloat(photo.width) / const
////        let height = CGFloat(photo.height) / const
////        return CGSize(width: width, height: height)
////    }
////
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
////        return sectionInserts
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return sectionInserts.left
////    }
////
////}
