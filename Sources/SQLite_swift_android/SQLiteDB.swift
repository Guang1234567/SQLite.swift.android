//
//  SQLiteDB.swift
//  TasksGalore
//
//  Created by Fahim Farook on 12/6/14.
//  Copyright (c) 2014 RookSoft Pte. Ltd. All rights reserved.
//
import Foundation
import CBinding_SQLite_swift_android

// MARK:- SQLiteDB Class
/// Simple wrapper class to provide basic SQLite database access.
public class SQLiteDB: SQLiteBase {
    
    /// Singleton instance for access to the SQLiteDB class
    public static let shared = SQLiteDB()
    
    private override init() {
        super.init()
    }
    
    /// Output the current SQLite database path
    public override var description:String {
        return "SQLiteDB: \(String(describing: path))"
    }
    
    /// Close the currently open SQLite database. Before closing the DB, the framework automatically takes care of optimizing the DB at frequent intervals by running the following commands:
    /// 1. **VACUUM** - Repack the DB to take advantage of deleted data
    /// 2. **ANALYZE** - Gather information about the tables and indices so that the query optimizer can use the information to make queries work better.
    public override func closeDB() {
        if db != nil {
            /*
             // Get launch count value
             let ud = UserDefaults.standard
             var launchCount = ud.integer(forKey:"LaunchCount")
             launchCount -= 1
             NSLog("SQLiteDB - Launch count \(launchCount)")
             var clean = false
             if launchCount < 0 {
             clean = true
             launchCount = 500
             }
             ud.set(launchCount, forKey:"LaunchCount")
             ud.synchronize()
             // Do we clean DB?
             if !clean {
             sqlite3_close(db)
             return
             }
             */
            // Clean DB
            NSLog("SQLiteDB - Optimize DB")
            let sql = "VACUUM; ANALYZE"
            if CInt(execute(sql:sql)) != SQLITE_OK {
                NSLog("SQLiteDB - Error optimize DB")
            }
            super.closeDB()
        }
    }
}
