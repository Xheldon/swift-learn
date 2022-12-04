//
//  BasicView.swift
//  swift-learn
//
//  Created by caoxudong on 18/11/2022.
//

import SwiftUI

struct BasicView: View {
    var body: some View {
        NavigationView {
            List(0..<20) { item in
                NavigationLink(destination: Text("Detail")) {
                    HStack {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 50, height: 50, alignment: .center)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Hello, world!")
                                .foregroundColor(.blue)
                            Text("Detail")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle(Text("导航条"))
        }
    }
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        BasicView()
    }
}
