import CocoaLumberjackSwift
import Foundation

public var PRINT_TEST = true

public struct ALog {
    public struct Key {
        public static let level = "ALog.Key.level"
    }

    public var disableFiles: [String]
    public var onlyFiles: [String] = []

    public init(_ level: LogLevel = dynamicLogLevel.l, disableFiles: [String] = [], onlyFiles: [String] = []) {
        // FIXME: 每个 log 的 level? 还是做成单例 ?
        dynamicLogLevel = level.d
        DDOSLogger.sharedInstance.logFormatter = ALogFormatter()
        DDLog.add(DDOSLogger.sharedInstance)

        let fileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)

        self.disableFiles = disableFiles
        self.onlyFiles = onlyFiles
    }

    public var level: LogLevel { dynamicLogLevel.l }

    public func error(_ message: @autoclosure () -> Any,
                      level: DDLogLevel = .all,
                      context: Int = 0,
                      file: StaticString = #file,
                      function: StaticString = #function,
                      line: UInt = #line,
                      tag: Any? = nil,
                      asynchronous async: Bool = false,
                      ddlog: DDLog = .sharedInstance)
    {
        guard disableFiles.filter({ file.description.contains($0) }).isEmpty else { return }
        if !onlyFiles.isEmpty, onlyFiles.filter({ file.description.contains($0) }).isEmpty { return }

        _DDLogMessage(message(), level: level, flag: .error, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
    }

    public func warn(_ message: @autoclosure () -> Any,
                     level: DDLogLevel = .all,
                     context: Int = 0,
                     file: StaticString = #file,
                     function: StaticString = #function,
                     line: UInt = #line,
                     tag: Any? = nil,
                     asynchronous async: Bool = false,
                     ddlog: DDLog = .sharedInstance)
    {
        guard disableFiles.filter({ file.description.contains($0) }).isEmpty else { return }
        if !onlyFiles.isEmpty, onlyFiles.filter({ file.description.contains($0) }).isEmpty { return }

        _DDLogMessage(message(), level: level, flag: .warning, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
    }

    public func info(_ message: @autoclosure () -> Any,
                     level: DDLogLevel = .all,
                     context: Int = 0,
                     file: StaticString = #file,
                     function: StaticString = #function,
                     line: UInt = #line,
                     tag: Any? = nil,
                     asynchronous async: Bool = false,
                     ddlog: DDLog = .sharedInstance)
    {
        guard disableFiles.filter({ file.description.contains($0) }).isEmpty else { return }
        if !onlyFiles.isEmpty, onlyFiles.filter({ file.description.contains($0) }).isEmpty { return }

        _DDLogMessage(message(), level: level, flag: .info, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
    }

    public func debug(_ message: @autoclosure () -> Any,
                      level: DDLogLevel = .all,
                      context: Int = 0,
                      file: StaticString = #file,
                      function: StaticString = #function,
                      line: UInt = #line,
                      tag: Any? = nil,
                      asynchronous async: Bool = false,
                      ddlog: DDLog = .sharedInstance)
    {
        guard disableFiles.filter({ file.description.contains($0) }).isEmpty else { return }
        if !onlyFiles.isEmpty, onlyFiles.filter({ file.description.contains($0) }).isEmpty { return }

        _DDLogMessage(message(), level: level, flag: .debug, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
    }

    public func verbose(_ message: @autoclosure () -> Any,
                        level: DDLogLevel = .all,
                        context: Int = 0,
                        file: StaticString = #file,
                        function: StaticString = #function,
                        line: UInt = #line,
                        tag: Any? = nil,
                        asynchronous async: Bool = false,
                        ddlog: DDLog = .sharedInstance)
    {
        guard disableFiles.filter({ file.description.contains($0) }).isEmpty else { return }
        if !onlyFiles.isEmpty, onlyFiles.filter({ file.description.contains($0) }).isEmpty { return }
        
        _DDLogMessage(message(), level: level, flag: .verbose, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
    }
}
