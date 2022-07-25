//
//  MainVC.swift
//  pupsroad
//
//  Created by KJH on 2022/07/22.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    lazy var moveKakaoMapBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("kakaoMap", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(moveKakaoMap), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var moveSignInpBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("signIn", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(moveSignIn), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(moveKakaoMapBtn)
        view.addSubview(moveSignInpBtn)
        
        moveKakaoMapBtn.snp.makeConstraints { (btn)  in
            btn.center.equalTo(view)
        }
        
        moveSignInpBtn.snp.makeConstraints { (btn) in
            btn.centerX.equalTo(view)
            btn.top.equalTo(moveKakaoMapBtn).inset(20)
        }
    }
    
    @objc
    func moveKakaoMap() {
        self.navigationController?.pushViewController(KakaoMapVC(), animated: true)
    }
    
    @objc
    func moveSignIn() {
        self.navigationController?.pushViewController(SignInVC(), animated: true)
    }
}

