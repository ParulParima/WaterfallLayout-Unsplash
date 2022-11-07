//
//  GalleryViewModel.swift
//  WaterfallLayout
//
//  Created by user230315 on 11/7/22.
//

import Foundation
import UIKit

struct StackEntity {
    var image: UIImage?
    var height: CGFloat
}

class GalleryViewModel {
    var error: String?
    var leftStack: [StackEntity] = []
    var rightStack: [StackEntity] = []
    
    func getdata(width: CGFloat, completion: @escaping () -> Void)
    {
        let count = 20
        var leftHeight: CGFloat = 0.0
        var rightHeight: CGFloat = 0.0
        getHeight(width: width){ [weak self] (urlImage, height) in
            self?.leftStack.append(StackEntity(image: urlImage, height: height))
            leftHeight = height
        }
        Thread.sleep(forTimeInterval: 1.2)
        var currentHeight: CGFloat = 0
        var currentImage: UIImage?
        var i = 1
        while i < (count-1) {
            getHeight(width: width){ [weak self] (urlImage, height) in
                currentImage = urlImage
                currentHeight = height
                if (leftHeight - rightHeight) <= 0 {
                    self?.leftStack.append(StackEntity(image: currentImage!, height: currentHeight))
                    leftHeight = leftHeight + currentHeight
                }
                else {
                    self?.rightStack.append(StackEntity(image: currentImage!, height: currentHeight))
                    rightHeight = rightHeight + currentHeight
                }
            }
            Thread.sleep(forTimeInterval: 1.2)
            i = i + 1
        }
        completion()
    }
    
    func getHeight(width: CGFloat, completion: @escaping (UIImage?,CGFloat) -> Void) {
        var image = UIImage(named:"oslash_logo")
        var size: CGSize?
        GalleryService().fetchGalleryData() { result in
            switch result {
            case .success(let data):
                image = UIImage(data: data as! Data)
                size = image?.size
                completion(image,(size!.height * width)/size!.width)
            case .failure(_):
                completion(image,60)
            }
        }
    }
}


