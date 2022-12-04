//
//  ObserverDataBinding.swift
//  swift-learn
//
//  Created by Xheldon on 29/11/2022.
//

import SwiftUI

// 观察者数据绑定
// ObservableObject
// @Published
// @ObservedObject

struct ObserverDataBindingView: View {
    // 需要初始化，是不是要么通过实例化的时候传入参数，要么 init 一下？
    // 此处的 AppData 是类型，下面的 Preview 中的 AppData 是值（跟 TS 中一样）
    // swift 类实例化的时候不是 new，是跟函数一样直接调用？
    // 如果没有在 main 中使用 .environmentObject 设置为全局对象
    @EnvironmentObject var appData: AppData
    // 就需要在这里设置为 ObservedObject 对象
//    @ObservedObject var appData: AppData
    var body: some View {
        VStack {
            // 双向绑定的时候才需要加 $
            Text(self.appData.AppTitle)
                .font(.largeTitle)
                .bold()
            Text(self.appData.Author)
                .font(.title)
                .bold()
                .foregroundColor(.gray)
            Button {
                withAnimation {
                    self.appData.Author = "Xheldon 666"
                }
                
            } label: {
                Text("更新")
                    .padding()
                    .font(.subheadline)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
    }
}

struct ObserverDataBindingView_Previews: PreviewProvider {
    static var previews: some View {
        // 此处为啥要调用一下 AppData 类？
//        ObserverDataBindingView(appData: AppData())
        // appData 设置为 EnvironmentObject 后就不用传入了，直接从全局获取即可
        ObserverDataBindingView()
            .environmentObject(AppData())
    }
}
