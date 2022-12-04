//
//  GetSysData.swift
//  swift-learn
//
//  Created by Xheldon on 29/11/2022.
//

import SwiftUI

struct GetSysDataView: View {
    // 将系统当前暗黑还是正常模式赋值给 mode 变量
    @Environment(\.colorScheme) var mode
    var body: some View {
        // 下面使用 mode == .dark 和使用 self.mode == .dark 是一样的
        // 问：如何定义一个本地 isDark 变量，使其值等于 mode == .dark 而不用每次都输入 mode == .dark 呢？
        // 答：使用一个类似于 Vue 中，计算属性的方式
        Text("系统颜色模式：\(isDark ? "暗黑" : "正常")")
    }
    var isDark: Bool {
        return self.mode == .dark
    }
}


struct GetSysDataView_Previews: PreviewProvider {
    static var previews: some View {
        GetSysDataView()
    }
}
