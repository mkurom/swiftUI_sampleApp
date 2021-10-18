//
//  ContentView.swift
//  MapSearchApp
//
//  Created by 安田誠 on 2021/08/14.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var inputText: String = ""
    
    @State var dispSearchKey: String = ""
    
    @State var disMapType: MKMapType = .standard
    
    var body: some View {
        VStack{
            TextField("キーワードを入力してください",
                      text: $inputText, onCommit: {
                dispSearchKey = inputText
                
                print("入力したキーワード：" + dispSearchKey)
            }).padding()
            
            ZStack(alignment: .bottomTrailing){
                MapView(searchKey: dispSearchKey, mapType: disMapType)
                
                Button(action:{
                    if disMapType == .standard{
                        disMapType = .satellite
                    } else if disMapType == .satellite{
                        disMapType = .hybrid
                    } else if disMapType == .hybrid{
                        disMapType = .satelliteFlyover
                    } else if disMapType == .satelliteFlyover{
                        disMapType = .hybridFlyover
                    } else if disMapType == .hybridFlyover{
                        disMapType = .mutedStandard
                    } else {
                        disMapType = .standard
                    }
                }) {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0,
                               height: 35.0,
                               alignment: .leading)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
