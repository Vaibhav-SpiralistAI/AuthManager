//
//  AuthManager.swift
//  AuthFramework
//
//  Created by Vaibhav Sharma on 11/02/25.
//

import Foundation
import FirebaseAuth

public class AuthManager{
    public static func signIn(email: String,password: String,completion: @escaping (Result<User, Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { ( Result, error) in
            if let error = error{
                completion(.failure(error))
            }else if let user = Result?.user{
                completion(.success(user))
            }
        }
    }
    public static func signUp(email: String,password: String,completion : @escaping(Result<User, Error>) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { ( Result, error) in
            if let error = error{
                completion(.failure(error))
            }else if let user = Result?.user{
                completion(.success(user))
            }
        }
    }
    public static func signOut(completion: @escaping (Result<Void , Error>) -> Void){
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        }catch let error{
            completion(.failure(error))
        }
    }
}
