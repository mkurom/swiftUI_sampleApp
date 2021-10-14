//
//  ButtonImageView.swift
//  soundApp
//
//  Created by 安田誠 on 2021/08/14.
//

import SwiftUI

struct ButtonImageView: View {
    
    let imageName: String
    
    var body: some View {
         Image(imageName)
            .renderingMode(.original)
    }
}

struct ButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(imageName: "guitar")
    }
}
