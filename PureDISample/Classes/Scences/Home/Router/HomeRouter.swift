//
//  HomeRouter.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import Pure

struct HomeRouter: FactoryModule {
    
    struct Dependency {
        
    }
    
    struct Payload {
        let home: HomeViewController
    }
    
    let dependency: Dependency
    let payload: Payload
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
    }
    
    func navigateBack() -> Void {
        self.payload.home.dismiss(animated: true, completion: nil)
    }
    
}
