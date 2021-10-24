//
//  ActivityView.swift
//  CameraApp
//
//  Created by 安田誠 on 2021/10/24.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    let shareItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: shareItems,
            applicationActivities: nil
        )
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
        
    }
}
