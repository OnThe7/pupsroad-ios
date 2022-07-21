//
//  LocationTrakingView.swift
//  pupsroad
//
//  Created by KJH on 2022/07/21.
//

import SwiftUI
import CoreLocation

struct LocationTrakingView: View {
    @StateObject var locationViewModel = LocationViewModel()
    
    var coordinate: CLLocationCoordinate2D? {
        locationViewModel.lastSeenLocation?.coordinate
    }
    
    var body: some View {
        switch locationViewModel.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            VStack {
                HStack {
                    Text(String(coordinate?.latitude ?? 0))
                    Text(String(coordinate?.longitude ?? 0))
                }
                Button(action: {
                    locationViewModel.addLatLng(lat: Float(coordinate?.latitude ?? 0), lng: Float(coordinate?.longitude ?? 0))
                }) {
                    Text("save")
                }
            }
        default:
            Button(action: {
                locationViewModel.requestPermission()
            }, label: {
                Label("Allow tracking", systemImage: "location")
            })
            Text("Unexpected status")
        }
        
    }
    
}

struct LocationTrakingView_Previews: PreviewProvider {
    static var previews: some View {
        LocationTrakingView()
    }
}
