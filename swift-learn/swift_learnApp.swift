//
//  swift_learnApp.swift
//  swift-learn
//
//  Created by caoxudong on 18/11/2022.
//

import SwiftUI
import FirebaseCore
// 启动的时候连接 Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct swift_learnApp: App {
    // 为 Firebase 设置来注册 app 委托
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            SheetsView()
        }
    }
}
