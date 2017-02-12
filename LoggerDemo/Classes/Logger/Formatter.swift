//
//  LogMessageFormatter.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

class Formatter {
    
    func formattedMessageStdErr(forObject object: Any, file: String, function: String, line: Int) -> String {
        let fileName : String = (file as NSString).components(separatedBy:"/").last!
        return "\(fileName)(\(function))[\(line)]: \(object)"
    }
    
    func formattedMessageFile(forObject object: Any, file: String, function: String, line: Int) -> String {
        let fileName : String = (file as NSString).components(separatedBy:"/").last!
        let message = "\(fileName)(\(function))[\(line)]: \(object)"
        return NSString(format: "%s %@", timeC(), message) as String
    }
}
