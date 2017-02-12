//
//  Logger.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 14/09/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

class Logger {
    
    private static var file: String?
    private static var dir: String?
    private static var fileLogging = false
    
    private static let formatter = Formatter()
    private static let stderrLogger: StdErrLoggerInterface = StdErrLogger()
    private static let fileLogger: FileLoggerInterface? = {
       
        if Logger.fileLogging {
            
            if let dir = dir, let file = file {
                return FileLogger(dir: dir, file: file)
            }
         
            print("Error: fileLogging configured but dir, file not set")
            
            return nil
        }
        
        return nil
    }()
    
    static func fileLogging(enabled: Bool) {
        fileLogging = enabled
    }

    static func fileLogging(dir _dir: String, file _file: String) {
        dir = _dir
        file = _file
    }

    static func Log(_ object: Any, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        
        let message1 = formatter.formattedMessageStdErr(forObject: object, file: file, function: function, line: line)
        stderrLogger.logMessage(message1)
        
        let message2 = formatter.formattedMessageFile(forObject: object, file: file, function: function, line: line)
        fileLogger?.logMessage(message2)
    }
}
