//
//  MainTabBarController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//

//import UIKit
//
//class MainTabBarController: UITabBarController {
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.backgroundColor = .gray
//        
//        let photoViewController = PhotoCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
//        
//        
//        viewControllers = [
//            generateNavigationController(rootVC: photoViewController, title: "Home", image: "home"),
//            generateNavigationController(rootVC: FavouritePhotoViewController(), title: "Favourite", image: "heart")
//        ]
//        
//    }
//    
//    private func generateNavigationController(rootVC: UIViewController, title: String, image: String) -> UIViewController {
//        let navigationViewController = UINavigationController(rootViewController: rootVC)
//        navigationViewController.tabBarItem.title = title
//        navigationViewController.tabBarItem.badgeColor = UIColor.black
//        navigationViewController.tabBarItem.image = UIImage(named: image)
//        
//        return navigationViewController
//    }
//        
//    
//}
