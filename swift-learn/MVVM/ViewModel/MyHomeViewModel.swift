//
//  MyHomeViewModel.swift
//  swift-learn
//
//  Created by Xheldon on 2/12/2022.
//

import SwiftUI

class MyHomeViewModel: ObservableObject {
    @Published var bookInfo: Book
    init() {
        self.bookInfo = Book(title: "Xheldon 的书", author: "Xheldon")
    }
    var appTitle: String {
        return self.bookInfo.title + "(\(self.bookInfo.author))"
    }
}
