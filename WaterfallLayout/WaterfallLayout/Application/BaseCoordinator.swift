//
//  BaseCoordinator.swift
//  WaterfallLayout
//
//  Created by user230315 on 11/7/22.
//

import Foundation

protocol BaseCoordinator: AnyObject {
    var childCoordinator: [BaseCoordinator] {get}
    func start()
}
