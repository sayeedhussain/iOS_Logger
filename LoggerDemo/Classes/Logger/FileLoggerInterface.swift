//
//  FileLoggerInterface.swift
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

import Foundation

protocol FileLoggerInterface: LoggerInterface {
    
    init?(dir: String, file: String)
    
    func clearLogs() -> Bool    
}
