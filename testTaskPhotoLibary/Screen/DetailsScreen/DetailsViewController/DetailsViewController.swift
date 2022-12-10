//
//  DetailsViewController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//

import UIKit
import CoreData

var dataPhot = ["urlImage": "", "userPhotoUrl": ""]

class DetailsViewController: UIViewController {
    private let mainView = DetailsView()
    
    var photosCoreData: PhotosCoreData?
    
    private let appDelegate = DetailsView()
    
    var activityVC: UIActivityViewController? = nil
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        
        
    }
    
    private func initViewController() {
        mainView.backgroundColor = .white
        mainView.likeButton.addTarget(self, action: #selector(didTapLikeButton), for: .touchUpInside)
        mainView.sharedButton.addTarget(self, action: #selector(actionBarButtonTapped), for: .touchUpInside)
        mainView.backButton.addTarget(self, action: #selector(didBackButton), for: .touchUpInside)
    }
    
    @objc
    func didBackButton() {
        dismiss(animated: true)
    }

    @objc
    private func actionBarButtonTapped() {
        let image = mainView.photoImage.image
        
        activityVC = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        self.present(activityVC!, animated: true)
    }
    
    @objc
    func didTapLikeButton() {
        saveInCoreData()
        
        if mainView.likeButton.isPointerInteractionEnabled {
            mainView.likeButton.setImage(UIImage(named: "heart"), for: .normal)
            mainView.likeButton.isPointerInteractionEnabled = false
            deleteInCoreData()
        } else {
            mainView.likeButton.setImage(UIImage(named: "heartRed"), for: .normal)
            mainView.likeButton.isPointerInteractionEnabled = true
        }
    }
    
    
    func red() {
        mainView.likeButton.setImage(UIImage(named: "heartRed"), for: .normal)
    }
    
    private func deleteInCoreData() {
        let fethRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PhotosCoreData")

        do {
            let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
            for value in results as! [PhotosCoreData]{
                if value.userName == mainView.userNameLabel.text || value.userName == nil {
                    CoreDataManager.instatnse.context.delete(value)
                }
            }
        } catch {
            print("error")
        }
        CoreDataManager.instatnse.saveContext()
        dismiss(animated: true)
    }
    
    private func saveInCoreData () {
        
        if photosCoreData == nil {
            photosCoreData = PhotosCoreData()
        }
        
        let fethRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PhotosCoreData")
        
        var i = 0
        do {
            let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
            for value in results as! [PhotosCoreData]{
                if value.userName == appDelegate.userNameLabel.text {
                    i += 1
                }
            }
        } catch {
            print("error")
        }
        
        if i == 0 {
            if let photosCoreData = photosCoreData {
                photosCoreData.likes = appDelegate.likeLabel.text
                photosCoreData.image = dataPhot["urlImage"]
                photosCoreData.dateAt = appDelegate.dateLabel.text
                photosCoreData.userImage = dataPhot["userPhotoUrl"]
                photosCoreData.userName = appDelegate.userNameLabel.text
                CoreDataManager.instatnse.saveContext()
            }
        }
       
//        print("=========")
//        do {
//            let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
//            for value in results as! [PhotosCoreData]{
//                print(value.userName)
//            }
//            print("=========")
//
//        } catch {
//            print("error")
//        }
//
         // remove
        do {
            let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
            for value in results as! [PhotosCoreData]{
                if value.userName == nil {
                    CoreDataManager.instatnse.context.delete(value)
                }
            }
        } catch {
            print("error")
        }
        CoreDataManager.instatnse.saveContext()
        
//
//        do {
//            let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
//            for value in results as! [PhotosCoreData]{
//                CoreDataManager.instatnse.context.delete(value)
//            }
//        } catch {
//            print("error")
//        }
//        CoreDataManager.instatnse.saveContext()
        
//        let fethRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PhotosCoreData")
//        do {
//            let results = try CoreDataManager.instatnse.context.fetch(fethRequest)
//            for value in results as! [PhotosCoreData]{
//                print(value.userName)
//            }
//            print("---------")
//
//        } catch {
//            print("error")
//        }
        
        
    }
    
    func delegateDataPhotos(photosData: UnsplashPhoto) {
        dataPhot["userPhotoUrl"] = photosData.user.profile_image["medium"]
        dataPhot["urlImage"] = photosData.urls["regular"]
    }


}

