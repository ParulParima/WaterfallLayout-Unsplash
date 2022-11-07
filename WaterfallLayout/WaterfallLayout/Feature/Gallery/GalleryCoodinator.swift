//
//  GalleryCoodinator.swift
//  WaterfallLayout
//
//  Created by user230315 on 11/7/22.
//

import Foundation

import Foundation
import UIKit

final class GalleryCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    var sceneProvider: GallerySceneProvider
    private(set) var childCoordinator: [BaseCoordinator] = []
    
    init(navigationController: UINavigationController, sceneProvider: GallerySceneProvider) {
        self.navigationController = navigationController
        self.sceneProvider = sceneProvider
    }
    
    func start() {
        let viewController = sceneProvider.makeGalleryScene()
        navigationController.pushViewController(viewController, animated: false)
    }
}
