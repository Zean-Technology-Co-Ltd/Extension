//
//  NotificationCenter+Extension.swift
//  qpyf
//
//  Created by zq on 2023/3/3.
//

import Foundation

extension NotificationCenter {

    class func registerNotification(_ observer: Any, _ selector: Selector, name: NotificationName) {
        self.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: name.rawValue), object: nil)
    }

    class func postNotification(name: NotificationName, userInfo: [AnyHashable : Any]?) {
        self.default.post(name: NSNotification.Name(rawValue: name.rawValue), object: nil, userInfo: userInfo)
    }

    class func remove(_ observer: NotificationName) {
        self.default.removeObserver(observer)
    }

    //只适合常驻内存
    class func observe(notificationName: NotificationName, block: @escaping (Notification) -> Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: notificationName.rawValue), object: nil, queue: OperationQueue.main, using: block)
    }
}

