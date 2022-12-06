//
//  FirebaseTestView.swift
//  swift-learn
//
//  Created by Xheldon on 5/12/2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct News: Identifiable {
    var id: String
    var title: String
}

// 据说是改良版的 News，目前还不懂，先放着
struct News2: Identifiable, Codable {
    // 属性包装器，自动映射文档 ID
    @DocumentID
    var id: String? = UUID().uuidString
    var title: String
    // 编码字段
    enum CodingKeys: String, CodingKey {
        case title
    }
}

class NewsHomeViewModel: ObservableObject {
    // 这里我理解 [News] 是一种类似于 TS 的 类型，然后加个括号就表示是值？
    // 所以此处表示一个 item 是 News 的数组？
    @Published var newsList = [News]()
    private var db = Firestore.firestore()
    func fetchNews() {
        // addSnapshotListener 类似于双向绑定，数据库更新则自动更新数据
        db.collection("news").limit(to: 5).addSnapshotListener { (query, error) in
            guard let documents = query?.documents else {
                print("没找到数据")
                return
            }
            self.newsList = documents.map { (doc) -> News in
                let data = doc.data()
                let id = doc.documentID
                let title = data["title"] as? String ?? ""
                return News(id: id, title: title)
            }
        }
    }
}

struct FirebaseTestView: View {
    @ObservedObject var viewModel = NewsHomeViewModel()
    var body: some View {
        Group {
            VStack {
                ForEach(self.viewModel.newsList) { item in
                    Text(item.title)
                    Text(item.id)
                }
            }
            .onAppear() {
                self.viewModel.fetchNews()
            }
        }
    }
}

struct FirebaseTestView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseTestView()
    }
}
