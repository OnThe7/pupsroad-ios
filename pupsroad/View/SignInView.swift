//
//  SignInView.swift
//  pupsroad
//
//  Created by KJH on 2022/07/21.
//

import SwiftUI
import FirebaseCore
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import GoogleSignIn

struct SignInView: View {
    var body: some View {
        Button("Kakao") {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoTalk() success.")
                        
                        //do something
                        _ = oauthToken
                    }
                }
            }
        }
        Button("Google") {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            
            GIDSignIn.sharedInstance.signIn(with: config, presenting: (UIApplication.shared.windows.first?.rootViewController)!) { user, error in
                
                if let error = error {
                    // ...
                    return
                }
                
                guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                else {
                    return
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
