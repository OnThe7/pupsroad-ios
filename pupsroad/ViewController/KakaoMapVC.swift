//
//  KakaoMapVC.swift
//  pupsroad
//
//  Created by KJH on 2022/07/22.
//

import UIKit

class KakaoMapVC: UIViewController, MTMapViewDelegate {
    
    var mapView: MTMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MTMapView(frame: view.frame)
        mapView.delegate = self
        mapView.baseMapType = .standard
        view.addSubview(mapView)
    }
}

