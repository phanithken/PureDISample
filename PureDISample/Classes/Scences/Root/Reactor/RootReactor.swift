//
//  RootReactor.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import Pure
import RxSwift
import ReactorKit

final class RootReator: Reactor, FactoryModule {
    
    enum Action {
        case didLoad
        case didClick
    }
    
    enum Mutation {
        
    }
    
    struct Dependency {
        let routerFactory: RootRouter.Factory
    }
    
    struct Payload {
        let root: RootViewController
    }
    
    struct State {
        
    }
    
    let dependency: Dependency
    let payload: Payload
    
    let initialState: RootReator.State = State()
    let router: RootRouter
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
        self.router = self.dependency.routerFactory.create(
            payload: RootRouter.Payload.init(
                root: self.payload.root
            )
        )
    }
    
    func mutate(action: RootReator.Action) -> Observable<RootReator.Mutation> {
        switch action {
        case .didLoad:
            self.router.navigateToHome()
            return Observable.empty()
        case .didClick:
            self.router.navigateToHome()
            return Observable.empty()
        }
    }
    
    func reduce(state: RootReator.State, mutation: RootReator.Mutation) -> RootReator.State {
        var newState = state
        return newState
    }
    
}
