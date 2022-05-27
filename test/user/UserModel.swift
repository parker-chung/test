//
//  UserModel.swift
//  test
//
//  Created by Parker Chung on 2021/4/26.
//

import Foundation

struct UserModel: Codable {
    let success:Bool!
    let message:String!
    let data:UserData!
}

struct UserData: Codable {
    let id:Int!
    let name:String!
    let email:String!
    let account:String!
    let registered_at:String!
    let profile_photo:String!
    let permission:Int!
    let total_question_amount:Int!
    let total_answered_amount:Int!
    let total_correct_amount:Int!
    let total_time_limit:Double!
    let total_time_used:Double!
}

