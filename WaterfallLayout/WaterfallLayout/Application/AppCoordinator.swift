//
//  AppCoordinator.swift
//  WaterfallLayout
//
//  Created by ParulParima on 11/7/22.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow
    private(set) var childCoordinator: [BaseCoordinator] = []
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //initialization of navigation controller and integrating it with window
        let navigationController = UINavigationController()
        
        let sceneProvider = GallerySceneProvider()
        let galleryCoordinator  = GalleryCoordinator(navigationController: navigationController, sceneProvider: sceneProvider)
        childCoordinator.append(galleryCoordinator)
        galleryCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
}
