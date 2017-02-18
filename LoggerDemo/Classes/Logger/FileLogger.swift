//
//  FileLogger.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

final class FileLogger {
    
    fileprivate static var filePath: String?
    
    required init?(dir: String, file: String) {
    
        let fileLoggerPath = FileLoggerPath()

        guard let path = try? fileLoggerPath.getPath(withDir: dir, file: file) else {
            return nil
        }
        
        FileLogger.filePath = path
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
}
