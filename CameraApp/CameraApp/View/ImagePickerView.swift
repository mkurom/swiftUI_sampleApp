//
//  ImagePickerView.swift
//  CameraApp
//
//  Created by 安田誠 on 2021/10/24.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {

    @Binding var isShowSheet: Bool
    
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            parent.isShowSheet = false
            
            }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isShowSheet = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // View生成時に呼び出される(UIViewControllerRepresentableを継承していたら定義する必要がある)
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let myImagePickerController = UIImagePickerController()

        myImagePickerController.sourceType = .camera

        myImagePickerController.delegate = context.coordinator

        return myImagePickerController
    }
    
    // Viewの更新時に呼び出される(UIViewControllerRepresentableを継承していたら定義する必要がある)
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
}

