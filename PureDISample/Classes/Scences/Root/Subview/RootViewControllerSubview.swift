//
//  RootViewControllerSubview.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import SnapKit
import Pure

final class RootViewControllerSubview: FactoryModule {
    
    struct Dependency {
        
    }
    
    struct Payload {
        let root: RootViewController
    }
    
    let dependency: Dependency
    let payload: Payload
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
    }
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Click", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    func updateSubviewConstraint() {
        self.button.snp.makeConstraints { (make) in
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(40)
            make.center.equalToSuperview()
        }
    }
}
