//
//  ImageScale.swift
//  swift-learn
//
//  Created by caoxudong on 27/11/2022.
//

import SwiftUI

struct ImageScaleView: View {
    // MARK: 跟 React 或者 Vue 的界面类似，View 中使用 state 管理当前页面状态
    @State private var zoomed: Bool = false
    var body: some View {
        // 上对齐 top，右上对齐不是 topRight，而是 topTrailing
        ZStack(alignment: self.zoomed ? .top : .topTrailing) {
            Image("NodeLog")
            .resizable()
            .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
            .navigationTitle(Text("头像"))
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                // 直接切换
//                self.zoom.toggle()
                // 动画切换
                withAnimation {
                    self.zoomed.toggle()
                }
            }
            Image("Avatar")
            .resizable()
            .frame(width: 50, height: 50, alignment: .center)
            .padding(.all, 10)
        }
    }
}

struct ImageScaleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImageScaleView()
        }
    }
}
