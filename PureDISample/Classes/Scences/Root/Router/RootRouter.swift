//
//  RootRouter.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import Pure

struct RootRouter: FactoryModule {
    
    /// dependency needed for router
    struct Dependency {
        let home: HomeViewController.Factory
    }
    
    /// payload required for doing sth with the router class
    struct Payload {
        let root: RootViewController
    }
    
    let dependency: Dependency
    let payload: Payload
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
    }
    
    func navigateToHome() -> Void {
        let vc = self.dependency.home.create(payload: HomeViewController.Payload.init())
        self.payload.root.navigationController?.pushViewController(vc, animated: true)
    }
    
}
