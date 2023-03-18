//
//  ContentView.swift
//  Okashi
//
//  Created by 安田誠 on 2023/03/18.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var okashiDataList = OkashiData()
    
    @State var inputText = ""
    
    var body: some View {
        TextField(
            "キーワードを入力してください",
            text: $inputText,
            onCommit: {
                okashiDataList.searchOkashi(keyword: inputText)
            }
        ).border(.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
