//
//  CustomButtonStyle.swift
//  swift-learn
//
//  Created by Xheldon on 2/12/2022.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    // makeBody 是必须要实现的抽象
    func makeBody(configuration: Configuration) -> some View {
        // configuration 中的 isPressed、label 等，都是固定的，并不是外部传入的，修饰之即可
        let isPressed = configuration.isPressed
        return configuration.label
            .padding(20)
            .border(.green, width: 5)
            .background(isPressed ? .green : .white)
            .scaleEffect(isPressed ? 1.2 : 1.0)
    }
}

struct CustomButtonStyleView
: View {
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("默认")
                    .font(.largeTitle)
            }
            .buttonStyle(DefaultButtonStyle())
            Button {
                
            } label: {
                Text("普通")
                    .font(.largeTitle)
            }
            .buttonStyle(PlainButtonStyle())
            Button {
                
            } label: {
                Text("无边框")
                    .font(.largeTitle)
            }
            .buttonStyle(BorderlessButtonStyle())
            Button {
                
            } label: {
                Text("有边框")
                    .font(.largeTitle)
            }
            .buttonStyle(BorderedButtonStyle())
            Button {

            } label: {
                Text("自定义")
                    .font(.largeTitle)
            }
            .buttonStyle(CustomButtonStyle())
        }
    }
}

struct CustomButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonStyleView()
    }
}
