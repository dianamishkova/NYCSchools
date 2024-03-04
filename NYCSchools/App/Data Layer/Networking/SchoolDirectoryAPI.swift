//
//  SchoolDirectoryAPI.swift
//  NYCSchools
//
//

import Foundation
import Alamofire

typealias SchoolListAPIResponse = (Swift.Result<[School]?, DataError>) -> Void
typealias SchoolSATAPIResponse = (Swift.Result<[SchoolSAT], DataError>) -> Void

protocol SchoolAPILogic {
    func getSchools(completion: @escaping (SchoolListAPIResponse))
    func getSchoolsSATResults(completion: @escaping (SchoolSATAPIResponse))
}

class SchoolAPI: SchoolAPILogic {
    private struct Constants {
        static let schoolListURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        static let schoolsSATURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    }
    
    func getSchools(completion: @escaping (SchoolListAPIResponse)) {
        AF.request(Constants.schoolListURL)
            .validate()
            .responseDecodable(of: [School].self) { response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(.networkingError(error.localizedDescription)))
                case .success(let schools):
                    completion(.success(schools))
                }
            }
    }
    
    func getSchoolsSATResults(completion: @escaping (SchoolSATAPIResponse)) {
        URLCache.shared.removeAllCachedResponses()
        AF.request(Constants.schoolsSATURL)
            .validate()
            .responseDecodable(of: [SchoolSAT].self) { response in
                switch response.result {
                case .failure(let error):
                    completion(.failure(.networkingError(error.localizedDescription)))
                case .success(let schoolSATs):
                    completion(.success(schoolSATs))
                }
            }
    }
    
//    private func retrieveSchoolsUsingStandardServices() {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "data.cityofnewyork.us"
//        urlComponents.path = "/resource/s3k6-pzi2.json"
//        
//        if let url = urlComponents.url {
//            let urlSession = URLSession(configuration: .default)
//            
//            let task = urlSession.dataTask(with: url) { data, response, error in
//                guard error == nil else {
//                    print("error occured \(error?.localizedDescription ?? "")")
//                    return
//                }
//                
//                if let data = data {
//                    let decoder = JSONDecoder()
//                    do {
//                        let schools = try decoder.decode([School].self,
//                                                         from: data)
//                        print("\(schools)")
//                    } catch let error {
//                        print("eror during parsing \(error)")
//                    }
//                    
//                }
//            }
//            task.resume()
//        }
//    }
}
