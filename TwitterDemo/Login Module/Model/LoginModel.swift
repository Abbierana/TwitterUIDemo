//
//  LoginModel.swift
//  TwitterDemo
//
//  Created by Abhishek Rana on 31/10/23.
//

import Foundation


struct LoginRequest: Encodable {
    let userEmail, userPassword: String
}

// MARK: - LoginResponseData

struct LoginResponse : Decodable {

    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable
{
    let userName: String
    let userID: Int
    let email: String

    enum CodingKeys: String, CodingKey {
        case userName
        case userID = "userId"
        case email
    }
}

struct LoginData {
    let errorMessage: String?
    let response: LoginResponse?
}
