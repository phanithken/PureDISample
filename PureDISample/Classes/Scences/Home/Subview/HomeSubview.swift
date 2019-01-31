//
//  HomeSubview.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import SnapKit
import Pure

final class HomeSubview: FactoryModule {
    
    struct Dependency {
        
    }
    
    struct Payload {
        let home: HomeViewController
    }
    
    let dependency: Dependency
    let paylaod: Payload
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.paylaod = payload
    }
    
    lazy var incrementBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("+", for: .normal)
        return button
    }()
    
    lazy var decrementBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("-", for: .normal)
        return button
    }()
    
    lazy var countIndicator: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    func updateSubviewConstraints() {
        
        self.incrementBtn.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(70)
        }
        
        self.decrementBtn.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(-70)
        }
        
        self.countIndicator.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
        
    }
    
}
