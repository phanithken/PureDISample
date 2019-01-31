//
//  HomeReactor.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ReactorKit
import Pure

final class HomeReactor: Reactor, FactoryModule {
    
    struct Dependency {
        let router: HomeRouter.Factory
    }
    
    struct Payload {
        let home: HomeViewController
    }
    
    enum Action {
        case Increment
        case Decrement
    }
    
    enum Mutation {
        case Increment
        case Decrement
    }
    
    struct State {
        var count: Int
        var indicator: String
    }
    
    let initialState: HomeReactor.State = State(
        count: 0
    )
    
    let dependency: Dependency
    let payload: Payload
    
    private var router: HomeRouter
    
    init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
        self.router = self.dependency.router.create(
            payload: HomeRouter.Payload.init(home: self.payload.home)
        )
    }
    
    func mutate(action: HomeReactor.Action) -> Observable<HomeReactor.Mutation> {
        switch action {
        case .Increment:
            return Observable.just(Mutation.Increment)
        case .Decrement:
            return Observable.just(Mutation.Decrement)
        }
    }
    
    func reduce(state: HomeReactor.State, mutation: HomeReactor.Mutation) -> HomeReactor.State {
        var newState = state
        switch mutation {
        case .Increment:
            newState.count += 1
            newState.indicator = String(newState.count)
        case .Decrement:
            newState.count -= 1
            newState.indicator = String(newState.count)
        }
        return newState
    }
    
}
