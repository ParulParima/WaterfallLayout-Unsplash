//
//  GallerySceneProvider.swift
//  WaterfallLayout
//
//  Created by user230315 on 11/7/22.
//

import Foundation

class GallerySceneProvider {
    func makeGalleryScene() -> GalleryViewController {
        let viewModel = GalleryViewModel()
        let  controller = GalleryViewController(viewModel: viewModel)
        return controller
    }
}
