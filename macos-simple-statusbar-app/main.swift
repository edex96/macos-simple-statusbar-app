//
//  main.swift
//  macos-simple-statusbar-app
//
//  Created by north on 11.01.2024.
//

import AppKit


let app = NSApplication.shared

let delegate = AppDelegate()

app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv) 

