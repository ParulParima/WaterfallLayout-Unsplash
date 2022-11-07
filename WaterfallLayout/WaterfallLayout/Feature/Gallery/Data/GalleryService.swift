//
//  GalleryService.swift
//  WaterfallLayout
//
//  Created by user230315 on 11/7/22.
//

import Foundation

class GalleryService {
    
    func fetchGalleryData(completion: @escaping (Result<Any, Error>) -> Void) {
        guard let url = URL(string: APIConstant.photoURL ) else { return }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (responseData, serviceResponse, error) in
            if (error == nil && responseData != nil) {
                    completion(.success(responseData as Any))
            }
                else {
                    completion(.failure(error!))
                }
        }.resume()
    }
}
