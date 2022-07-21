//
//  MapView.swift
//  pupsroad
//
//  Created by KJH on 2022/07/21.
//

import SwiftUI

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> MTMapView {
        let view = MTMapView(frame: .zero)
        view.showCurrentLocationMarker = true
        view.currentLocationTrackingMode = .onWithoutHeading
        view.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:  37.456518177069526, longitude: 126.70531256589555)), zoomLevel: 4, animated: false)
        
        return view
    }
    
    func updateUIView(_ uiView: MTMapView, context: Context) {}
}
