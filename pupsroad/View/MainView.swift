//
//  MainView.swift
//  pupsroad
//
//  Created by KJH on 2022/07/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: LocationTrakingView(),
                    label: {
                        Text("위치 트래킹")
                    })
                
                NavigationLink(
                    destination: MapView(),
                    label: {
                        Text("카카오 지도")
                    })
            }
            .navigationBarHidden(true)
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
