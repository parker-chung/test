//
//  SQLite.swift
//  test
//
//  Created by Parker Chung on 2021/5/3.
//

import Foundation
import SQLite

class SQLite {
    var db: Connection!
    let table = Table("histories")
    var date = Expression<String>("date")
    var score = Expression<Double>("score")
    
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
    ).first!
    
//    let db = try Connection("\(path)/db.sqlite3")
    
    init() {
        do {
            db = try Connection("\(path)/db.sqlite3")
        } catch let error {
            print(error)
        }
    }
    
    func create() {
        do {
            try db.run(table.create(ifNotExists: true) { t in
                t.column(date)
                t.column(score)
            })
        } catch let error {
            print(error)
        }
    }
    
    func insert(data: HistoryModel) {
        do {
            try db.run(table.insert(
                date <- "",
                score <- 1
            ))
        } catch let error {
            print(error)
        }
    }
}
