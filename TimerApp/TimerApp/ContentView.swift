//
//  ContentView.swift
//  TimerApp
//
//  Created by 安田誠 on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var timerHandler : Timer?
    
    @State var count = 0
    
    @AppStorage("timer_value") var timerValue = 10
    
    @State var showAlert = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                
                VStack(spacing: 30.0){
                    Text("残り\(timerValue - count)秒").font(.largeTitle)
                    
                    HStack{
                        Button(action: {
                            startTimer()
                        }) {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            if let nuwrapedTimerHandler = timerHandler {
                                if nuwrapedTimerHandler.isValid {
                                    nuwrapedTimerHandler.invalidate()
                                }
                            }
                        }) {
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                    
                    //
                    Button(action: {
                        if let nuwrapedTimerHandler = timerHandler {
                            if nuwrapedTimerHandler.isValid {
                                nuwrapedTimerHandler.invalidate()
                            }
                        }
                        count = 0
                    }) {
                        Text("リセット")
                            .font(.title)
                            .foregroundColor(Color.black)
                            .frame(width: 140)
                    }
                    //
                }
            }
            .onAppear{
                count = 0
            }
            
            .navigationBarItems(
                trailing:NavigationLink(
                    destination: SettingView()) {
                        Text("秒数設定")
                    }
            )
            .alert(isPresented: $showAlert) {
                Alert(title: Text("終了"), message: Text("タイマー終了"), dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    func countDownTimer() {
        count += 1
        
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
            
            showAlert = true
        }
    }
    
    func startTimer() {
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid {
                return
            }
        }
        
        if timerValue - count <= 0 {
           count = 0
        }
        
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
