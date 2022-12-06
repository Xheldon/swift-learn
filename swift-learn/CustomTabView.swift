//
//  CustomTabView.swift
//  swift-learn
//
//  Created by Xheldon on 5/12/2022.
//

import SwiftUI

struct CustomTabView: View {
    @State var selectIndex: Int = 10
    var body: some View {
        TabView(selection: self.$selectIndex, content: {
            // 这里传入 selected 是为了内部切换到其他 View
            View1(selected: self.$selectIndex)
                .tabItem {
                    Image(systemName: "house")
                    Text("主页")
                }
                // 对子 view 打 tag + 参数 selected 为某个 tag 的方式进行导航
                .tag(10)
            View2(selected: self.$selectIndex)
                .tabItem {
                    Image(systemName: "gear")
                    Text("设置")
                }
                .tag(20)
        })
    }
}

struct View1: View {
    @Binding var selected: Int
    var body: some View {
        VStack {
            Text("主页").font(.title)
            Button("去设置") {
                self.selected = 20
            }
        }
    }
}

struct View2: View {
    @Binding var selected: Int
    var body: some View {
        VStack {
            Text("设置").font(.title)
            Button("去主页") {
                self.selected = 10
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
