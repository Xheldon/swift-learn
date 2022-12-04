//
//  DateBindingWithOtherView.swift
//  swift-learn
//
//  Created by Xheldon on 29/11/2022.
//

import SwiftUI

struct Header: View {
    @Binding var title: String
    var count: Int = 0
    var body: some View {
        Text(self.title + "/\(count)")
    }
    init(title: Binding<String>) {
        // 将外部传入的 Binding 类型赋值给内部的变量并想让其实时响应变化，需要使用 @Binding 装饰
        // 假设变量是 xxx，则赋值的时候就使用 _xxx 进行赋值。
        // 注意传入的参数也是 Binding 类型
        self._title = title
        // 因为 title 是 Binding 类型，并不是真的 String，因此需要拿到里面的真正 String
//      self.count = self._title.wrappedValue // 或者👇🏻
        // wrappedValue 见 DataBindingView 文件的含义
        self.count = title.wrappedValue.count
    }
}

struct DataBindingWithOtherView: View {
    @State private var title: String = "Xheldon"
    var body: some View {
        VStack {
            Text(self.title)
            // 传入使用 $xxx 表示数据绑定，接收使用 _xxx 表示数据绑定
            Header(title: self.$title)
            Button {
                self.title = "Xheldon 最牛逼"
            } label: {
                Text("确定")
            }

        }
    }
}

struct DataBindingWithOtherView_Previews: PreviewProvider {
    static var previews: some View {
        DataBindingWithOtherView()
    }
}
