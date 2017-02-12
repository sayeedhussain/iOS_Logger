//
//  FileLogger.c
//  PersistenceDemo
//
//  Created by Sayeed Munawar Hussain on 12/02/17.
//  Copyright © 2017 Zensoft. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <pthread/pthread.h>
#include <assert.h>

static FILE *logger = NULL;
static pthread_mutex_t lock;
static const char* logFilePath = NULL;

void initializeC(const char* _logFilePath) {
    
    if (pthread_mutex_init(&lock, NULL) != 0) {
        printf("%s[%d] mutex initialization failed.", __FUNCTION__, __LINE__);
        assert(0);
    }
    
    logger = fopen(_logFilePath, "a");
    
    if (!logger) {
        printf("%s[%d] logger initialization failed.", __FUNCTION__, __LINE__);
        assert(0);
    }
    
    logFilePath = _logFilePath;
}

void logMessageC(char *message) {
    
    pthread_mutex_lock(&lock);
    
    fprintf(logger,"%s\n", message);
    fflush(logger);
    
    //    fprintf(stderr,"%s %s\n", s, [message UTF8String]);

    pthread_mutex_unlock(&lock);
}

int clearLogFileC() {
    
    pthread_mutex_lock(&lock);
    
    logger = freopen(logFilePath, "w", logger);
    
    if (!logger) {
        printf("%s[%d] logger clearing failed.", __FUNCTION__, __LINE__);
        assert(0);
    }
    
    pthread_mutex_unlock(&lock);
    
    return 1;
}

const char * timeC() {
    
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    char *s = asctime(tm);
    s[strlen(s) - 1] = '\0';

    return s;
}
