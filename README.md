# Logger
A thread-safe logging utility for better logging in iOS.

#### Usage

    Logger.Log("Hello")

* prints **ViewController.swift(viewDidLoad())[23]: Hello** to Xcode console
    
#### Usage With FileLogging
Logger must be set up for file logging, preferably in AppDelegate (applicationDidFinishLaunch)

    //configuration for FileLogging
    Logger.fileLogging(enabled: true)
    let path = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
    Logger.fileLogging(dir: path, file: "log.txt")

* prints **ViewController.swift(viewDidLoad())[23]: Hello** to Xcode console
* prints **Sat Feb 18 23:38:37 2017 ViewController.swift(viewDidLoad())[23]: Hello** to log.txt file stored in /Caches dir in app sandbox.

#### Installation
Download the zip and copy /Logger folder to you project.
Add this line to your bridging header file **#import "FileLoggerC.h"**. If it doesn't exist, you need to create one.

