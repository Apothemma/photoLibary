//
//  SceneDelegate.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 04.12.2022.
//
import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    var navController = UINavigationController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene)
            let root = PhotoCollectionViewController()
            let navigation = MyMainNavigationController(nibName: nil, bundle: nil)
            
            window?.rootViewController = navigation
            
            window?.makeKeyAndVisible()
            
        }
    }
    
}
