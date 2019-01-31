//
//  CompositionRoot.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import Pure

final class CompositionRoot: FactoryModule {
    
    /// dependency for AppDelegate
    struct Dependency {
        let window: UIWindow
    }
    
    struct Payload {
        
    }
    
    let dependency: Dependency
    let payload: Payload
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
    }
    
    // this is where the PureDI happen, it should be called in where the application is loaded
    static func resolve() -> CompositionRoot {
        let window = UIWindow(frame: UIScreen.main.bounds)
        return CompositionRoot(
            dependency: CompositionRoot.Dependency.init(window: window),
            payload: CompositionRoot.Payload.init())
    }
    
    // navigation root factory
    lazy var navigationRootViewControllerFactory = RootNavigationViewController.Factory(
        dependency: RootNavigationViewController.Dependency.init(root: self.rootViewControllerFactory)
    )
    
    // root scence factory
    lazy var rootViewControllerFactory = RootViewController.Factory(
        dependency: RootViewController.Dependency.init(
            window: self.dependency.window,
            reactorFactory: self.rootReactorFactory,
            subviewFactory: self.rootSubviewFactory
        )
    )
    
    // root subview factory
    lazy var rootSubviewFactory = RootViewControllerSubview.Factory(
        dependency: RootViewControllerSubview.Dependency.init()
    )
    
    // root reactor factory
    lazy var rootReactorFactory = RootReator.Factory(
        dependency: RootReator.Dependency.init(
            routerFactory: self.rootRouterFactory
        )
    )
    
    // root router factory
    lazy var rootRouterFactory = RootRouter.Factory(
        dependency: RootRouter.Dependency.init(
            home: self.homeFactory
        )
    )
    
    // home scence factory
    lazy var homeFactory = HomeViewController.Factory(
        dependency: HomeViewController.Dependency.init(
            reactor: self.homeReactorFactory,
            subview: self.homeSubviewFactory
        )
    )
    
    // home reactor factory
    lazy var homeReactorFactory = HomeReactor.Factory(
        dependency: HomeReactor.Dependency.init(
            router: self.homeRouterFactory
        )
    )
    
    // home router factory
    lazy var homeRouterFactory = HomeRouter.Factory(
        dependency: HomeRouter.Dependency.init()
    )
    
    // home subview factory
    lazy var homeSubviewFactory = HomeSubview.Factory(
        dependency: HomeSubview.Dependency.init()
    )
}
