//
//  Environment.swift
//  pupsroad
//
//  Created by KJH on 2022/07/25.
//

import Foundation

public enum Environment {
    enum Keys {
        enum Plist {
            static let appName = "APP_NAME"
            static let appBundleID = "APP_BUNDLE_ID"
            static let appMode = "APP_MODE"
            
            static let kakaoAppKey = "KAKAO_APP_KEY"
            
            static let apiUrl = "API_URL"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let appName: String = {
        guard let name = Environment.infoDictionary[Keys.Plist.appName] as? String else {
            fatalError("APP_NAME not set in plist for this environment")
        }
        return name
    }()
    
    static let appBundleID: String = {
        guard let bundleID = Environment.infoDictionary[Keys.Plist.appBundleID] as? String else {
            fatalError("APP_BUNDLE_NAME not set in plist for this environment")
        }
        return bundleID
    }()
    
    static let appMode: String = {
        guard let mode = Environment.infoDictionary[Keys.Plist.appMode] as? String else {
            fatalError("APP_MODE not set in plist for this environment")
        }
        return mode
    }()
    
    static let kakaoAppKey: String = {
        guard let kakaoKey = Environment.infoDictionary[Keys.Plist.kakaoAppKey] as? String else {
            fatalError("KAKAO_APP_KEY not set in plist for this environment")
        }
        return kakaoKey
    }()
    
    static let apiUrl: URL = {
        guard let urlString = Environment.infoDictionary[Keys.Plist.apiUrl] as? String else {
            fatalError("API_URL not set in plist for this environment")
        }
        guard let url = URL(string: urlString) else {
            fatalError("API_URL is invalid")
        }
        return url
    }()
}
