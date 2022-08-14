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
        let logLevel = logMessage.flag.l.emoji
        let fileInfo = "[\(logMessage.function ?? "nil")][\(logMessage.file.components(separatedBy: "/").last ?? "nil")][\(logMessage.line)]"
        // 换行加 logLevel 前缀
        let message = logMessage.message
            .components(separatedBy: .newlines).map { "\(logLevel) | " + $0 }
            .reduce("") { $0 + $1 + "\n" }
            .dropLast()
            
        return "\(message) \(fileInfo)"
    }
}

public enum LogLevel: String, CaseIterable {
    case error
    case warning
    case info
    case debug
    case verbose

    public var emoji: String {
        switch self {
        case .verbose:  return "🌪"
        case .debug:    return "🌈"
        case .info:     return "🌨"
        case .warning:  return "⚠️"
        case .error:    return "❌"
        }
    }

    var d: DDLogLevel {
        switch self {
        case .error:    return .error
        case .warning:  return .warning
        case .info:     return .info
        case .debug:    return .debug
        case .verbose:  return .verbose
        }
    }
}

extension DDLogFlag {
    var l: LogLevel {
        switch self {
        case .error:    return .error
        case .warning:  return .warning
        case .info:     return .info
        case .debug:    return .debug
        case .verbose:  return .verbose
        default: fatalError()
        }
    }
}

public extension DDLogLevel {
    var l: LogLevel {
        switch self {
        case .error:    return .error
        case .warning:  return .warning
        case .info:     return .info
        case .debug:    return .debug
        case .verbose:  return .verbose
        default: fatalError()
        }
    }
}
