//
//  histories.swift
//  test
//
//  Created by Parker Chung on 2021/5/3.
//

import Foundation

struct HistoryModel: Codable {
    let success: Bool!
    let message: String!
    let data: [HistoryData]!
}

struct HistoryData: Codable {
    let id: Int!
    let score: Float!
    let total_question_amount: Int!
    let total_answered_amount: Int!
    let total_correct_amount: Int!
    let total_time_limit: Float!
    let total_time_used: Float!
    let created_at: String!
}
