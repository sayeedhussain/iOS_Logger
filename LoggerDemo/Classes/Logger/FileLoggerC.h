//
//  FileLogger.h
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

#ifndef FileLogger_h
#define FileLogger_h

void initializeC(const char *logFilePath);

void logMessageC(const char *message);

int clearLogFileC();

const char * timeC();

#endif /* FileLogger_h */
