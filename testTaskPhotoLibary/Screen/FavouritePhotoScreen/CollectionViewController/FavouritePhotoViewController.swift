//
//  FavouritePhotoViewController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//


import UIKit
import CoreData
import SDWebImage


class FavouritePhotoViewController: UICollectionViewController {
    
    private let appDelegate = PhotosCoreData()

    struct Constants {
        static let entity = "PhotosCoreData"
        static let sortName = "userName"
        static let cellName = "FavouriteCell"
    }

    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entity)
        let sortDescriptor = NSSortDescriptor(key: Constants.sortName, ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.instatnse.context, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchResultsController.delegate = self
        
        collectionView.backgroundColor = .white
        
        navigationItem.title = "Favourites"

        
        setupCollectionView()
    }
    
    
    private func setupCollectionView() {
        collectionView.register(FavouriteCell.self, forCellWithReuseIdentifier: FavouriteCell.reuseId)
                
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                
        do {
            try fetchResultsController.performFetch()
        } catch {
            print("error FavouritePhotoViewController setupCollectionView()")
        }
    }
    
}


// MARK: UICollectionViewDelegateFlowLayout

extension FavouritePhotoViewController: UICollectionViewDelegateFlowLayout {
      override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          let fethRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PhotosCoreData")
          var k = 0
          do {
              let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
              for value in results as! [PhotosCoreData]{
                  if value.userName != nil {
                      k += 1
                  }
              }
          } catch {
              print("error")
          }
          return k
      }
      
      override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCell.reuseId, for: indexPath as IndexPath) as! FavouriteCell
          
          let data = fetchResultsController.object(at: indexPath) as! PhotosCoreData
          cell.loadData(userName: data.userName, urlUserPhoto: data.userImage, urlPhoto: data.image)
          return cell

      }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = fetchResultsController.object(at: indexPath) as! PhotosCoreData
        DetailsView().delegateDataPhotos(userName: data.userName, countLike: data.likes, dateAt: data.dateAt, photoUser: data.userImage, image: data.image)
        let NextVC = DetailsViewController()
        present(NextVC, animated: true)

    }
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 15, height: view.frame.width / 2 + 30)
    }
}




extension FavouritePhotoViewController: NSFetchedResultsControllerDelegate {
    
    // информирует о начале изменения
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                collectionView.insertItems(at: [indexPath])
            }
        case .update:
            if let indexPath = indexPath {
                let data = fetchResultsController.object(at: indexPath) as! PhotosCoreData
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteCell.reuseId, for: indexPath as IndexPath) as! FavouriteCell
                cell.loadData(userName: data.userName, urlUserPhoto: data.userImage, urlPhoto: data.image)
            }
        case .delete:
            if let indexPath = indexPath {
                collectionView.deleteItems(at: [indexPath])
            }
        default: break
        }
    }
    
    // окончание изменения данных
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
}
