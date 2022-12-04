//
//  DataBinding.swift
//  swift-learn
//
//  Created by Xheldon on 28/11/2022.
//

import SwiftUI

struct DataBindingView: View {
    @State private var title: String = "此乃标题"
    @State private var input: String = ""
    var body: some View {
        VStack {
            Text(self.title)
                .font(.title)
            TextField("请输入内容", text: self.$input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(10)
                .font(.title)
            Button(action: {
                self.title = self.input
            }) {
                Text("确定")
                    .font(.largeTitle)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
        }
    }
}

struct DataBindingView_Previews: PreviewProvider {
    static var previews: some View {
        DataBindingView()
    }
}
