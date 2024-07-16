//
//  NetworkAPIHelper.swift
//  iTunesAPITableView
//
//  Created by Shivam Shishangia on 11/06/24.
//

import UIKit

// MARK: Singleton API Class to fetch API data and image
class NetworkAPIHelper: APIHelperProtocol {
    static let shared = NetworkAPIHelper()

    private init() {}

    func fetchData<T: Decodable>(apiURL: URL?, completion: @escaping (T?) -> Void) {
        guard let apiURL = apiURL else {
            print(Constants.Errors.invalidURLError.rawValue)
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard error == nil else {
                fatalError(Constants.Errors.error.rawValue + "\(String(describing: error))")
            }

            guard let data = data else {
                fatalError(Constants.Errors.fetchDataError.rawValue)
            }
            self.parseResponse(for: data, completion: completion)
        }.resume()
    }

    func parseResponse<T: Decodable>(for data: Data, completion: @escaping (T?) -> Void) {
        do {
            let searchResult = try JSONDecoder().decode(T.self, from: data)
            completion(searchResult)
        } catch {
            completion(nil)
        }
    }
}

class ImageDownloader {
    static let shared = ImageDownloader()
    
    private var cache = NSCache<NSString, UIImage>()
    private var currentCacheCost = 0
    private var maxCacheCost = 100 * 1024 * 1024
    private var keys = Set<String>()
    
    private init() {
        cache.totalCostLimit = maxCacheCost
    }
    
    func fetchImage(from url: URL, completion: @escaping ((Result<UIImage, Error>) -> ())) {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(.success(image))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }

            guard let data = data,
            let image = UIImage(data: data) else {
                if let defaultImage = UIImage(named: "AppIcon") {
                    completion(.success(defaultImage))
                }
                return
            }

            let imageCost = self.calculateCost(for: image)
            while self.currentCacheCost + imageCost > self.maxCacheCost,
                  self.keys.count != 0 {
                if let firstKey = self.keys.first {
                    self.cache.removeObject(forKey: firstKey as NSString)
                    self.keys.remove(firstKey)
                }
            }
            self.cache.setObject(image, forKey: url.absoluteString as NSString, cost: imageCost)
            self.keys.insert(url.absoluteString)
            self.currentCacheCost += imageCost
            
            completion(.success(image))
        }.resume()
    }
    
    private func calculateCost(for image: UIImage) -> Int {
        if let cgImage = image.cgImage {
            return cgImage.bytesPerRow * cgImage.height
        }
        return 0
    }
}
