//
//  SignInVC.swift
//  pupsroad
//
//  Created by KJH on 2022/07/22.
//

import SnapKit
import RxSwift
import KakaoSDKCommon
import RxKakaoSDKCommon
import KakaoSDKAuth
import RxKakaoSDKAuth
import KakaoSDKUser
import RxKakaoSDKUser

class SignInVC: UIViewController {
    
    let disposeBag = DisposeBag()
    
    lazy var kakaoSignInBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Kakao", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(kakaoSignIn), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var googleSignInBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Google", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(googleSignIn), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(kakaoSignInBtn)
        view.addSubview(googleSignInBtn)
        
        kakaoSignInBtn.snp.makeConstraints { (btn)  in
            btn.center.equalTo(view)
        }
        
        googleSignInBtn.snp.makeConstraints { (btn) in
            btn.centerX.equalTo(view)
            btn.top.equalTo(kakaoSignInBtn).inset(20)
        }
    }
    
    @objc
    func kakaoSignIn() {
        print("kakao")
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.rx.loginWithKakaoTalk()
                .subscribe(onNext:{ (oauthToken) in
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }, onError: {error in
                    print(error)
                })
                .disposed(by: disposeBag)
        } else {
            UserApi.shared.rx.loginWithKakaoAccount()
                .subscribe(onNext:{ (oauthToken) in
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }, onError: {error in
                    print(error)
                })
                .disposed(by: disposeBag)
        }
    }
    
    @objc
    func googleSignIn() {
    }
}

