//
//  LeaderboardModel.swift
//  test
//
//  Created by Parker Chung on 2021/6/5.
//

import Foundation

struct LeaderboardModel: Codable {
    let success: Bool!
    let message: String!
    let data: LeaderboardData!
}

struct LeaderboardData: Codable {
    let leaderboard: [LeaderData]!
    let own: LeaderData!
}

struct LeaderData: Codable {
    let score: Float!
    let user: LeaderUserData!
}

struct LeaderUserData: Codable {
    let id: Int!
    let name: String!
    let account: String!
}
