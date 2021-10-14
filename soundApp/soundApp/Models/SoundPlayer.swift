//
//  SoundPlayer.swift
//  soundApp
//
//  Created by 安田誠 on 2021/08/14.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {

    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    
    var cymbalPlayer: AVAudioPlayer!

    func cymbalPlay() {
        do {
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            
            cymbalPlayer.play()
        } catch {
            print("シンバルのデータがありません")
        }
    }

    let guitarData = NSDataAsset(name: "guitarSound")!.data
    
    var guitarPlayer: AVAudioPlayer!

    func guitarPlay() {
        do {
            self.guitarPlayer = try AVAudioPlayer(data: self.guitarData)
            
            self.guitarPlayer.play()
        } catch {
            print("ギターのデータがありません")
        }
    }

}
