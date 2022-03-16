//
//  File.swift
//
//
//  Created by marcow on 2021/6/10.
//

import CocoaLumberjackSwift
import Foundation

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
        let fileInfo = "[\(logMessage.function ?? "nil")][\(logMessage.file.components(separatedBy: "/").last ?? "nil")][\(logMessage.line)]"
        // 换行加 logLevel 前缀
        let message = logMessage.message
            .components(separatedBy: .newlines).map { "\(logLevel) | " + $0 }
            .reduce("") { $0 + $1 + "\n" }
            .dropLast()
            
        return "\(message) \(fileInfo)"
    }
}
