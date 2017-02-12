//
//  FileLogger.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

class FileLogger {
    
    fileprivate static var filePath: String?
    
    required init?(dir: String, file: String) {
        
        if file.isEmpty {
            return nil
        }
        
        var isDir: ObjCBool = ObjCBool(false)
        
        if !FileManager.default.fileExists(atPath: dir, isDirectory: &isDir) {
            return nil
        }
        
        if !isDir.boolValue {
            return nil
        }
        
        FileLogger.filePath = (dir as NSString).appendingPathComponent(file) as String
        FileLogger.once
    }
    
    fileprivate static let once: Void = {
        initializeC(filePath)
    }()
}

extension FileLogger: FileLoggerInterface {
   
    func logMessage(_ message: String) {
        logMessageC(message)
    }
    
    func clearLogs() -> Bool {
        return clearLogFileC() == 1
    }
    
    func logFilePath() -> String {
        return FileLogger.filePath!
    }
}
