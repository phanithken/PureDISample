//
//  RootNavigationViewController.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import UIKit
import Pure

class RootNavigationViewController: UINavigationController, FactoryModule {
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    struct Dependency {
        let root: RootViewController.Factory
    }
    
    struct Payload {
        
    }
    
    let dependency: Dependency
    let payload: Payload
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = self.dependency.root.create(payload: RootViewController.Payload.init())
        self.pushViewController(vc, animated: false)
    }
}
