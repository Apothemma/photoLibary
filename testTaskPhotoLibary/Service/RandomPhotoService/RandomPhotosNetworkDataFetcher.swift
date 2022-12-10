//
//  RandomPhotosNetworkDataFetcher.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//

import Foundation


class RandomPhotosNetworkDataFetcher {
    
    var networkService = RandomPhotoNetworkService()
    
    func fetchImages(completion: @escaping (RandomPhoto?) -> ()) {
        networkService.request { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: RandomPhoto.self, from: data)
            completion(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
    
}

