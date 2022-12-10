//
//  MyMainTabBarController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//

import UIKit

class MyMainTabBarController: UITabBarController {
    let photoCollectionNavigationController = PhotoCollectionNavigationController(nibName: nil, bundle: nil)
    let favouritePhotoNavigationController = FavouritePhotoNavigationController(nibName: nil, bundle: nil)
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let topLine: UIView = {
        let obj = UIView()
        obj.backgroundColor = .systemGray5
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundEffect = nil
        
        viewControllers = [photoCollectionNavigationController, favouritePhotoNavigationController]
        tabBar.tintColor = .systemBlue
        tabBar.isTranslucent = false
        tabBar.addSubview(topLine)
        tabBar.backgroundColor = .white
        tabBar.standardAppearance = appearance
    
        selectedIndex = 0
        self.viewControllers?.forEach({
            $0.tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 10, weight: .medium)], for: .normal)
                })
        
        photoCollectionNavigationController.setUpTabBarItem()
        favouritePhotoNavigationController.setUpTabBarItem()

    }
}
