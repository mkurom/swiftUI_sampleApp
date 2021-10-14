//
//  ContentView.swift
//  soundApp
//
//  Created by 安田誠 on 2021/08/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let soundPlayer = SoundPlayer()

        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fill)
            
            HStack{
                Button(action: {
                    soundPlayer.cymbalPlay()
                }){
                    ButtonImageView(imageName: "cymbal")
                }
                
                Button(action: {
                    soundPlayer.guitarPlay()
                }){
                    ButtonImageView(imageName: "guitar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
