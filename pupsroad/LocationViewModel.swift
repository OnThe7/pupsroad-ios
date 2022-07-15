//
//  LocationViewModel.swift
//  pupsroad
//
//  Created by KJH on 2022/07/15.
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastSeenLocation: CLLocation?
    
    @Published var latLngArray: Array<Dictionary<Float, Float>> = []
    
    private let locationManager: CLLocationManager
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func addLatLng(lat: Float, lng: Float) {
        latLngArray.append([lat: lng])
        
        print(latLngArray)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastSeenLocation = locations.last
    }

    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.startUpdatingLocation()
    }
}
