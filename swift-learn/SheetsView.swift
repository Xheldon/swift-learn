//
//  SheetsView.swift
//  swift-learn
//
//  Created by Xheldon on 5/12/2022.
//

import SwiftUI

struct PopView: View {
    @Binding var show: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Button(action: {
                self.show = false
            }) {
                Image(systemName: "x.circle").font(.title)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topTrailing)
            .padding()
            // （布局技巧）用这 Spacer 和下面那个 Spacer 将上面那个 x 按钮向上挤，下面这个 Text Button 想下挤
            Spacer()
            Text("Pop 视图").font(.largeTitle)
            Button("关闭窗体") {
                self.show = false
            }.font(.title)
            Spacer()
        }
    }
}

struct SheetsView: View {
    @State private var show: Bool = false
    @State private var message: String = ""
    @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
    var body: some View {
        // 这节顺便加上 GeometryReader
        VStack {
            // GeometryReader 会尽可能占据空间
            Text(orientation.isLandscape ? "横屏" : "竖屏")
                .onReceive(NotificationCenter.Publisher(center: .default, name: UIDevice.orientationDidChangeNotification)) { _ in
                    self.orientation = UIDevice.current.orientation
                }
            GeometryReader { geometry in
                HStack {
                    Spacer()
                    Text("父容器大小\(Int(geometry.size.width)) * \(geometry.size.height)")
                        .font(.title)
                        .onTapGesture {
                            print("Global:",
                                  geometry.frame(in: .global).width,
                                  geometry.frame(in: .global).height,
                                  geometry.frame(in: .global).minX,
                                  geometry.frame(in: .global).minY)
                            print("Local:",
                                  geometry.frame(in: .local).width,
                                  geometry.frame(in: .local).height,
                                  geometry.frame(in: .local).minX,
                                  geometry.frame(in: .local).minY)
                        }
                }
            }
            Spacer()
            Button("显示：" + self.message) {
                self.show = true
            }
            .font(.title)
            // isPresented 控制显隐
            // sheet 的定义是：
            //func sheet<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, content: @escaping () -> Content) -> some View where Content : View
            // 其中并没有 item 参数，但是我输入 item 作为参数的时候却又有提示，why？
            // 可能是 sheet 会根据你实际写的内容进行定义提示？
            // 我输入 .sheet( 的时候会提示 .sheet(item:onDismiss:content)
            //  和 .sheet(isPresented:onDismiss:content)
    //        .sheet(isPresented: self.$show) {
    //            PopView(show: self.$show)
    //        }
            // sheet 语法跟 popover 类似
            // 但是在 iPhone 该方法和 .sheet 完全一样
            // 该方法仅限 iPad 使用有效，但是 arrowEdge 始终无效，说是对 MacOS 生效，而 iOS 始终是 .top
            // 但是网上说这个东西要配合 Menu 使用，还有说呗非酋的
    //        .popover(isPresented: self.$show, arrowEdge: .top) {
    //            PopView(show: self.$show)
    //        }
            // alert 内部需要有 Alert 组件，跟 actionSheet 中一定要有 ActionSheet 组件一样
    //        .alert(isPresented: self.$show) {
    //            Alert(title: Text("这是个警告⚠️！"), message: Text("不可以~"), dismissButton: .cancel(Text("没意思关了吧")))
    //        }
            .actionSheet(isPresented: self.$show) { () -> ActionSheet in
                ActionSheet(title: Text("标题"), message: Text("内容"), buttons: [
                    .default(Text("选项1"), action: {
                        self.message = "我是选项1"
                    }),
                    .default(Text("选项2"), action: {
                        self.message = "我是选项2"
                    }),
                    // 破坏性选项，所以是红色
                    .destructive(Text("选项3"), action: {
                        self.message = "我是选项3"
                    }),
                    .cancel(Text("取消"), action: {
                        self.message = "取消"
                    })
                ])
            }
            Spacer()
        }
    }
}

struct SheetsView_Previews: PreviewProvider {
    static var previews: some View {
        SheetsView()
    }
}
