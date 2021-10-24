//
//  PHPickerView.swift
//  CameraApp
//
//  Created by 安田誠 on 2021/10/24.
//

import SwiftUI
import PhotosUI


struct PHPickerView: UIViewControllerRepresentable {
    
    @Binding var isShowSheet: Bool
    
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PHPickerView
        
        init(parent: PHPickerView) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            if let result = results.first {
                
                result.itemProvider.loadObject(ofClass: UIImage.self) {
                    (image, error) in
                    if let unwrapImage = image as? UIImage {
                        self.parent.captureImage = unwrapImage
                    } else {
                        print("使用できる写真がありません")
                    }
                }
            } else {
                parent.isShowSheet = false
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PHPickerView>) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        
        configuration.filter = .images
        
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PHPickerView>) {
        //
    }
}
