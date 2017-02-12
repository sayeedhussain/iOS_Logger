//
//  FileLoggerInterface.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

protocol FileLoggerInterface {
    
    init?(dir: String, file: String)
    
    func logMessage(_ message: String)
    
    func clearLogs() -> Bool
    
    func logFilePath() -> String
}
