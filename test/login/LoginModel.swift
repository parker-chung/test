//
//  LoginModel.swift
//  test
//
//  Created by Parker Chung on 2021/4/12.
//

import Foundation

struct LoginModel: Codable {
    let success: Bool!
    let message: String!
    let data: LoginData!
}

struct LoginData: Codable {
    let id: Int!
    let name: String!
    let email: String!
    let account: String!
    let register_at: String!
    let profile_photo: String!
    let permission: Int!
    let token: String!
}


