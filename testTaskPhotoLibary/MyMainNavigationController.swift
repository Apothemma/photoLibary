//
//  MyMainNavigationController.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//

import UIKit

class MyMainNavigationController: UINavigationController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
           self.modalPresentationStyle = .fullScreen
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()

           navigationBar.isTranslucent = true
           isNavigationBarHidden = true
           
           viewControllers = [MyMainTabBarController()]
       }
}
