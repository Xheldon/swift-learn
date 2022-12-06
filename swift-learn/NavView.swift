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
    // 顺便把一个 slider 组件也放进去好了
    @State private var imageWidth: CGFloat = UIScreen.main.bounds.width
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
                // NavigationLink 还有个 selection 和 tag 参数，用发类似与 Tab 对应参数
                // 另外 iPad 和 iPhone 的表现也不一样
                NavigationLink("第二个", destination: Text("文本详情"))
                NavigationLink("第三个", destination: ChildView())
                // 导航的内容可以用其他的空间，不只是纯文本
                NavigationLink(destination: Text("其他文本详情")) {
                    Text("第四个")
                }
                // 还可以在当前元素定义一个 @State 变量，传入 ChildView 的 @Binding
                // 然后在 NavigationLink 中的有个叫「isActive」的参数控制显隐
                // 父 View 设置其为 true 会显示子 View，子 View 接收到该 Binding 设置为 false 就会隐藏（因为父 View 的 Link isAction 为 false 了）
                    .foregroundColor(self.setColor ? .red : .blue)
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
                // 传 $ 变量的，都可以理解为是传引用，可以将值交给其内部处理的意思
                Slider(value: self.$imageWidth, in: 100...UIScreen.main.bounds.width * 3, step: 10)
                    .padding(10)
                    .frame(width: UIScreen.main.bounds.width - 20)
                VStack {
                    Spacer()
                    Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: self.imageWidth)
                }
            }
        }
    }
}



struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
