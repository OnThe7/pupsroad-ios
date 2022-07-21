//
//  pupsroadApp.swift
//  pupsroad
//
//  Created by KJH on 2022/07/15.
//

import SwiftUI
import FirebaseCore
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct pupsroadApp: App {
    init() {
        FirebaseApp.configure()
        KakaoSDK.initSDK(appKey: "22e4701e912ad1220534187a04a2d280")
    }
    
    var body: some Scene {
        WindowGroup {
            MainView().onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
