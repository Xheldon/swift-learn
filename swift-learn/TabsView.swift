//
//  TabView.swift
//  swift-learn
//
//  Created by Xheldon on 5/12/2022.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        // 在 TabView 外面定义 Text 会覆盖掉 TabView
        // Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        TabView {
            Text("第一个")
                .tabItem {
                    Image(systemName: "house")
                    Text("主页")
                }
            Text("第二个")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("日历")
                }
                // 这个 font 修饰的是 「第二个」
                .font(.largeTitle)
        }
        // 像轮播图一样左右切换显示，tab 显示在下方像轮播图下面的小点点
        // 这种方式的话 Image 下面的 Text 是无效的
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//        .background(.gray.opacity(0.5))
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
