//
//  FirestoreService.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 29.08.2022.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let db = Firestore.firestore()
    
    func getDocument<T: Decodable>(as type: T.Type,
                                   collection: String,
                                   completion: @escaping (Result<[T], Error>) -> Void) {
        
        db.collection(collection).getDocuments { (snapShot, error) in
            if let error = error {
                completion(.failure(error))
                print("Error get snapShot!")
            } else {
                if let documents = snapShot?.documents {
                    do {
                        let records: [T] = try documents.compactMap { document in
                            try document.data(as: type.self)}
                        DispatchQueue.main.async {
                            completion(.success(records))
                        }
                    } catch let error {
                        completion(.failure(error))
                        print("Error decode documents!")
                    }
                }
            }
        }
    }
}

class ImageManager {
    
    
    static let shared = ImageManager()
    
    private init() {}
    
    func getImage(imageUrl: URL, completion: @escaping (Data, URLResponse) -> Void) {
       // guard let imageUrls = URL(string: imageUrl) else { return }
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard imageUrl == response.url else { return }
            
            DispatchQueue.main.async {
                completion(data, response)
            }
        }.resume()
    }
}

        


