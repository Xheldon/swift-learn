//
//  SwiftUIView.swift
//  swift-learn
//
//  Created by Xheldon on 2/12/2022.
//

import SwiftUI

struct MyHomeView: View {
    // 如果 XCode 版本比较高，可以把 ObservedObject 写为 StateObject
    // 后者的生命周期归当前 View 管理，前者不是
    @ObservedObject private var viewModel = MyHomeViewModel()
    var body: some View {
        Text(self.viewModel.appTitle)
            .padding()
            .font(.title)
            .foregroundColor(.red)
    }
}

struct MyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyHomeView()
    }
}
