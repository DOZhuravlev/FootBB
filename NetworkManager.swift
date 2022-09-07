//
//  FirestoreService.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 29.08.2022.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class NetworkManager {
    
    static let shared = NetworkManager()
    
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

        


