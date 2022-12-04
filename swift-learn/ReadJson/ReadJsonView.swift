//
//  ReactJsonView.swift
//  swift-learn
//
//  Created by Xheldon on 3/12/2022.
//

import SwiftUI

// 读取 json 要先写好 json 的内部格式，才能按照这个做映射
struct TheBook: Codable, Identifiable {
    let id: Int
    let title: String
    let desc: String
}

struct TheBookAppData: Codable {
    var list: [TheBook]
}

// 读取 json 分两步：从硬盘读取 json 文件到内存 -> 将内存中文件 json 按照一定格式解码

// FIXME: 应该有那种类似于 ts 一样的 typeof 的操作符，可以写成 typeof TheBookAppData.list 作为返回值类型的语法而不用再写一遍 [TheBook] 作为返回值，此处后续补充
func readJson() -> [TheBook] {
    // 这段代码不知道为啥，刚写好的时候一直报错走到「从硬盘读取失败」里面，然后折腾了一番包括退出 XCode，清除项目缓存之类的
    // 然后就能正常运行了，无语
    let filename: String = "the_json_data.json"
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("从硬盘读取失败")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("从内存加载失败")
    }
    // 注意这个 decode 的第一个参数类型，叫 Decodable.Protocol 就是要被 decode 的 json 文件需要满足的格式
    // 但是传个 AppData 类型不就行了？为啥要传 AppData.self？
    guard let appData = try? JSONDecoder().decode(TheBookAppData.self, from: data) else {
        fatalError("格式化 JSON 失败")
    }
    return appData.list
}

struct ReadJsonView: View {
    let appData: TheBookAppData
    init() {
        self.appData = TheBookAppData(list: readJson())
    }
    var body: some View {
        VStack {
            List(self.appData.list) { book in
                VStack(alignment: .leading, spacing: 0) {
                    Text(book.title)
                        .font(.title)
                    Text(book.desc)
                        .font(.title)
                }
            }
            Text("Hello")
        }
    }
}

struct ReadJsonView_Previews: PreviewProvider {
    static var previews: some View {
        ReadJsonView()
    }
}
