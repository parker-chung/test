//
//  RegisterModel.swift
//  test
//
//  Created by Parker Chung on 2021/4/24.
//

import Foundation

struct RegisterModel: Codable {
    let success: Bool!
    let message: String!
    let data: RegisterData
}

struct RegisterData: Codable {
    let id: Int!
    let name: String!
    let email: String!
    let account: String!
    let register_at: String!
    let profile_photo: String!
    let permission: Int!
}
