//
//  FileLoggerPathHelper.swift
//  LoggerDemo
//
//  Created by Sayeed Munawar Hussain on 18/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

class FileLoggerPath {
    
    func getPath(withDir dir: String, file: String) throws -> String {
        
        try fileValid(dir)

        try dirValid(dir)
        
        return path(dir: dir, file: file)
    }

    private func fileValid(_ file: String) throws {
        
        if file.isEmpty {
            throw error(withMessage: "Invalid file. File is empty.")
        }
    }

    private func dirValid(_ dir: String) throws {
        
        var isDir: ObjCBool = ObjCBool(false)
        
        if !FileManager.default.fileExists(atPath: dir, isDirectory: &isDir) {
            throw error(withMessage: "Dir does not exist.")
        }
        
        if !isDir.boolValue {
            throw error(withMessage: "Dir is not a dir.")
        }
    }
    
    private func path(dir: String, file: String) -> String {
        return (dir as NSString).appendingPathComponent(file) as String
    }
    
    private func error(withMessage message: String) -> Error {
        return NSError(domain: "FileLoggerErrorDomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: message])
    }
}
