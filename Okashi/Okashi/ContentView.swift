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
    
    @State var showSafari = false
    
    var body: some View {
        
        VStack {
            TextField(
                "キーワードを入力してください",
                text: $inputText,
                onCommit: {
                    okashiDataList.searchOkashi(keyword: inputText)
                }
            )
            .border(.secondary)
            .padding()
            
            List(okashiDataList.okashiList) { okashi in

                Button(action: {
                        showSafari.toggle()
                }) {
                    HStack {
                        Image(uiImage: okashi.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        
                        Text(okashi.name)
                    }
                }
                .sheet(isPresented: self.$showSafari, content: {
                    SafariView(url: okashi.link)
                        .edgesIgnoringSafeArea(.bottom)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
