//
//  RandomPhotoNetworkService.swift
//  testTaskPhotoLibary
//
//  Created by Вячеслав on 08.12.2022.
//



import Foundation

class RandomPhotoNetworkService {
    
    // построение запроса данных по URL
    func request(completion: @escaping (Data?, Error?) -> Void)  {
        
        let parameters = self.prepareParaments()
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "get"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID Qi_f3zI3bk7aCxmuzM2WQWhOOHGQsDChWiEutOeVUwI"
        return headers
    }
    
    private func prepareParaments() -> [String: String] {
        var parameters = [String: String]()
        parameters["count"] = String(24)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos/random"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data? , Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
