//
//  ViewController.swift
//  pupsroad
//
//  Created by KJH on 2022/07/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var moveKakaoMapBtn: UIButton = {
        let btn = UIButton()
       
        btn.setTitle("kakaoMap", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(moveKakaoMap), for: .touchUpInside)
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(moveKakaoMapBtn)
        
        moveKakaoMapBtn.snp.makeConstraints { (btn)  in
            btn.center.equalTo(view)
        }
    }
    
    @objc
    func moveKakaoMap() {
        self.navigationController?.pushViewController(MapViewController(), animated: true)
    }
}

