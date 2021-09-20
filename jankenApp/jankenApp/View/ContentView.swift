//
//  ContentView.swift
//  jankenApp
//
//  Created by 安田誠 on 2021/07/12.
//

import SwiftUI

struct ContentView: View {
    
    @State var answerNumber = 0
    
    var NOT_START = 0
    var STONE_WINNER = 1
    var SCISSORS_WINNER = 2
    var PAPER_WINNER = 3
    
    var body: some View {
        VStack{
            
            Spacer()
            if (answerNumber == NOT_START){
                Text("じゃんけんを始めます")
                    .padding(.bottom)
            } else if (answerNumber == STONE_WINNER){
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()

                Text("グーの勝ち")
                    .padding(.bottom)
            } else if (answerNumber == SCISSORS_WINNER){
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()

                Text("チョキの勝ち")
                    .padding(.bottom)
            } else {
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Spacer()

                Text("パーの勝ち")
                    .padding(.bottom)
            }
            
            Button(action: {
                let newNumber = Int.random(in: 1...3)

                repeat{
                    answerNumber = Int.random(in: 1...3)
                } while newNumber == answerNumber
                
                answerNumber = newNumber
                
                }) {
                Text("じゃんけんをする")
                    .frame(maxWidth: .infinity)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .font(.title)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .previewDevice("iPhone 8")
    }
}
