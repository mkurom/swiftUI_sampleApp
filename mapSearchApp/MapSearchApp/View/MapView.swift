//
//  MapView.swift
//  MapSearchApp
//
//  Created by 安田誠 on 2021/08/15.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let searchKey:String
        
    // MKMapViewを戻り値としている
    func makeUIView(context: Context) -> MKMapView{
        MKMapView()
    }
    
    func updateUIView(_ uiview: MKMapView, context: Context){
        print(searchKey)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(searchKey, completionHandler:{(placemarks, error) in
                if let unwrapPlacemarks = placemarks,
                   let firstPlacemark = unwrapPlacemarks.first,
                   let location = firstPlacemark.location{
                    let targetCoordiate = location.coordinate
                    
                    print(targetCoordiate)
                    
                    // pinを生成
                    let pin = MKPointAnnotation()
                    // pinの緯度軽度を設定
                    pin.coordinate = targetCoordiate
                    pin.title = searchKey
                    // 地図にpinを追加
                    uiview.addAnnotation(pin)
                    // targetCoordiateを中心に表示範囲（メートル単位）を設定
                    uiview.region = MKCoordinateRegion(
                        center: targetCoordiate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0
                    )
                }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京タワー")
    }
}
