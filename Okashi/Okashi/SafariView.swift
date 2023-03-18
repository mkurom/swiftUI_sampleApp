//
//  SafariView.swift
//  Okashi
//
//  Created by 安田誠 on 2023/03/19.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
