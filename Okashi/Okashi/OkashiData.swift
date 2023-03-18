//
//  OkashiData.swift
//  Okashi
//
//  Created by 安田誠 on 2023/03/18.
//

import Foundation
import UIKit

struct OkashiItem: Identifiable {
    let id = UUID()
    let name : String
    let link: URL
    let image: UIImage
}

class OkashiData: ObservableObject{
    
    struct ResultJson: Codable {
        
        struct Item: Codable {

            let name: String?
            
            let url: URL?
            
            let image: URL?
        }
        
        let item: [Item]?
    }
    
    @Published var okashiList: [OkashiItem] = []
    
    func searchOkashi(keyword: String) -> Void {
        print(keyword)
        
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r")
        else {
            return
        }
        
        print(req_url)
        
        let req = URLRequest(url: req_url)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(
            with: req,
            completionHandler: {
                (data, response, error) in

                session.finishTasksAndInvalidate()

                do {
                    let decoder = JSONDecoder()

                    let json = try decoder.decode(ResultJson.self, from: data!)

//                    print(json)
                    
                    if let items = json.item {
                        
                        self.okashiList.removeAll()
                        
                        for item in items {
                        
                            if let name = item.name,
                               let link = item.url,
                               let imageUrl = item.image,
                               let imageData = try? Data(contentsOf:  imageUrl),
                               let image = UIImage(data: imageData)?.withRenderingMode(.alwaysOriginal) {
                                
                                let okashi = OkashiItem(name: name, link: link, image: image)
                                
                                self.okashiList.append(okashi)
                            }
                        }
                        
                        print(self.okashiList)
                    }
                } catch {
                    print("エラーが発生しました")
                }
            }
        )
        
        task.resume()
    }
}
