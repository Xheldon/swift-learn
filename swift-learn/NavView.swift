//
//  NavView.swift
//  swift-learn
//
//  Created by Xheldon on 4/12/2022.
//

import SwiftUI

struct ChildView: View {
    // 将当前
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack {
            Text("子视图")
                .navigationTitle("View 详情 nav bar")
                .navigationBarTitleDisplayMode(.inline)
                // 内置的导航返回按钮给关了
                .navigationBarBackButtonHidden(true)
                // 这个是编程式返回
                .navigationBarItems(leading: Button {
                    // 这个方法非常重要要记住，很常用
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("点击我看效果")
                })
        }
    }
}

struct NavView: View {
    @State private var setColor: Bool = false
    @State private var setFont: Bool = false
    var body: some View {
        // 我理解 NavigationView 应该只控制上面的导航条
        // 但是为什么会需要把 Text 也放到里面，而且还显示的是正文内容，我不理解
        // 还不理解的是，为什么.navigationBarItem、.navigationTitle 等是修饰 Text
        // 而不是修饰 NavigationView？
        // 而且试了一下，如果把 navigationBarItems 放到第二个 Text 中修饰，就不会显示了
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
                Text("Hello World")
                // 可以导航到一个控件，也可以导航到一个 View
                NavigationLink("第二个", destination: Text("文本详情"))
                NavigationLink("第三个", destination: ChildView())
                // 导航的内容可以用其他的空间，不只是纯文本
                NavigationLink(destination: Text("其他文本详情")) {
                    Text("第四个")
                }
                    .foregroundColor(self.setColor ? .blue : .red)
                    .font(self.setFont ? .title : .body)
                    // 之前的语法是 navigationBarTitle 将下面俩写在一起了
                    // 新语法提示我现在是分开了
                    .navigationTitle("这是导航栏")
                    .navigationBarTitleDisplayMode(.inline)
                    // 之前的是下面的写法，新语法提示我使用 toolbar，但是后者我不会用
                    .navigationBarItems(leading: Button {
                        self.setColor.toggle()
                    } label: {
                        Text("改变颜色")
                    }, trailing: Button {
                        self.setFont.toggle()
                    } label: {
                        Text("改变字体")
                    })
                    //.toolbar {}
                Text("World Says: OK，Fine！")
            }
        }
    }
}



struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
