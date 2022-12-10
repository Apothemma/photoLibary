//
//  FavouritePhotoNavigationController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//

import UIKit

class FavouritePhotoNavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let favouriteViewController = FavouritePhotoViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.viewControllers = [favouriteViewController]
    }
    
    func setUpTabBarItem() {
        let tabBarItemIcon = UIImage(named: "heart")
        let tabBarItem = UITabBarItem(title: "Favourite",
                                      image: tabBarItemIcon,
                                      selectedImage: tabBarItemIcon?.withRenderingMode(.alwaysTemplate))
            self.tabBarItem = tabBarItem
        }
}

