//
//  InputLimit.swift
//  swift-learn
//
//  Created by Xheldon on 4/12/2022.
//

import SwiftUI

class InputViewModel: ObservableObject {
    @Published var textValue: String = "" {
        // didSet 类似于 Vue 的生命周期，不同的是是对该值进行生命周期，而不是整个组件
        didSet {
            if textValue.trimmingCharacters(in: .whitespaces).count > 8 {
                // 如果输入超过 8 个字符，则无法输入
                self.textValue = oldValue
            }
        }
    }
    @Published var message: String = "消息"
}

// 这个名字要和文件名保持一致
struct InputLimitView: View {
    @ObservedObject var input: InputViewModel = InputViewModel()
    var body: some View {
        VStack {
            // 注意此处，是 self.$input 而不是 self.input.$textValue
            // 是否是只能对本组件内的成员添加 $？
            TextField("请输入用户名", text: self.$input.textValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disableAutocorrection(true)
            Button {
                let temp = self.input.textValue.trimmingCharacters(in: .whitespaces)
                if temp.isEmpty {
                    self.input.message = "不能为空"
                } else {
                    self.input.message = "OK"
                }
            } label: {
                Text("确定")
            }
            Spacer()
            Text(self.input.message)
        }
    }
}

struct InputLimit_Previews: PreviewProvider {
    static var previews: some View {
        InputLimitView()
    }
}
