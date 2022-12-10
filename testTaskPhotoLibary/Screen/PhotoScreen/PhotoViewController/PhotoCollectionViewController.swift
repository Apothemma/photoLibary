//
//  PhotoCollectionViewController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//
//


import UIKit
import AVFoundation




class PhotoCollectionViewController: UICollectionViewController {

    var networkDataFetcher = NetworkDataFetcher()
        
    private var timer: Timer?

    private var photos = [UnsplashPhoto]()
    
        

    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.networkDataFetcher.fetchImages(searchTerm: "summer") { [weak self] (searchResults) in
            guard let fetchedPhoto = searchResults else { return }
            self?.photos = fetchedPhoto.results
            self?.collectionView.reloadData()
        }
        
        collectionView.backgroundColor = .white
        setupSearchBar()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseId)
                
        let layout = PinterestLayout()
        collectionView.collectionViewLayout = layout
        layout.delegate = self
        
        collectionView?.contentInset = UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
        
    }
    

    private func setupSearchBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.delegate = self
    }

}


// MARK: UISearchBarDelegate

extension PhotoCollectionViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkDataFetcher.fetchImages(searchTerm: searchText) { [weak self] (searchResults) in
                guard let fetchedPhoto = searchResults else { return }
                self?.photos = fetchedPhoto.results
                self?.collectionView.reloadData()
            }
        })
    }
}



// MARK: UICollectionViewDelegateFlowLayout

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
      override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
      }
      
      override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath as IndexPath) as! PhotoCell
          cell.unspachPhot = photos[indexPath.item]
        return cell
      }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DetailsView().delegateDataPhotos(photosData: photos[indexPath.item])
        DetailsViewController().delegateDataPhotos(photosData: photos[indexPath.item])
        let NextVC = DetailsViewController()
        present(NextVC, animated: true)
        
    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photo = photos[indexPath.item]
        let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let height = CGFloat(photo.height) * widthPerItem / CGFloat(photo.width)
        return CGSize(width: widthPerItem, height: height)
        
        
    }
}



extension PhotoCollectionViewController: PinterestLayoutDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return CGFloat(photos[indexPath.item].height / 20)
  }
}
