//
//  ObserverDataBinding.swift
//  swift-learn
//
//  Created by Xheldon on 29/11/2022.
//

import Foundation
import SwiftUI

// 需要用 class 存储全全局的类，class 使用起来是引用，而像 struct 等结构体是复制

// 这个类就是 Model，数据源
class AppData: ObservableObject {
    // 想让外部访问，需要加上这个 @Published
    @Published var AppTitle: String = "Swift Learn"
    @Published var Author: String = "Xheldon"
}
