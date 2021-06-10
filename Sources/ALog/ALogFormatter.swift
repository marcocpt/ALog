//
//  File.swift
//  
//
//  Created by marcow on 2021/6/10.
//

import Foundation
import CocoaLumberjackSwift

class ALogFormatter: NSObject, DDLogFormatter {
    func format(message logMessage: DDLogMessage) -> String? {
        let logLevel: String
        switch logMessage.flag {
        case .error:
            logLevel = "❌"
        case .warning:
            logLevel = "⚠️"
        case .info:
            logLevel = "🌨"
        case .debug:
            logLevel = "🌈"
        case .verbose:
            logLevel = "🌪"
        default:
            fatalError()
        }
        let fileInfo = "(\(logMessage.file.components(separatedBy: "/").last ?? "nil") - \(logMessage.function ?? "nil") \(logMessage.line))"
        return "\(logLevel) | \(logMessage.message) \(fileInfo)"
    }
}
