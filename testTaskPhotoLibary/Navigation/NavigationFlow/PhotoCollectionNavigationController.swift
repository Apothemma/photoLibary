//
//  PhotoCollectionNavigationController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//

import UIKit

class PhotoCollectionNavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    private func setup() {
        let photoListViewController = PhotoCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.viewControllers = [photoListViewController]
    }
    
    func setUpTabBarItem() {
        let tabBarItemIcon = UIImage(named: "home")
        let tabBarItem = UITabBarItem(title: "Home",
                                      image: tabBarItemIcon,
                                      selectedImage: tabBarItemIcon?.withRenderingMode(.alwaysTemplate))
            self.tabBarItem = tabBarItem
        }
}
