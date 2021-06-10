import Foundation
import CocoaLumberjackSwift

public struct ALog {
    
    public init(_ level: DDLogLevel = dynamicLogLevel) {
        // FIXME: 每个 log 的 level? 还是做成单例 ?
        dynamicLogLevel = level
        DDOSLogger.sharedInstance.logFormatter = ALogFormatter()
        DDLog.add(DDOSLogger.sharedInstance)
        
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = 60 * 60 * 24 // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
    }
    
    public func error(_ message: String) {
        DDLogError(message)
    }
    
    public func warn(_ message: String) {
        DDLogWarn(message)
    }
    
    public func info(_ message: String) {
        DDLogInfo(message)
    }
    
    public func debug(_ message: String) {
        DDLogDebug(message)
    }
    
    public func verbose(_ message: String) {
        DDLogVerbose(message)
    }
}
