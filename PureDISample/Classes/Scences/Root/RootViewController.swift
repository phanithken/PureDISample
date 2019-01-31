//
//  RootViewController.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import UIKit
import ReactorKit
import Pure
import RxCocoa
import RxSwift

class RootViewController: UIViewController, View, FactoryModule {
    
    typealias Reactor = RootReator
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    private var subviews: RootViewControllerSubview?
    
    struct Dependency {
        let window: UIWindow
        let reactorFactory: RootReator.Factory
        let subviewFactory: RootViewControllerSubview.Factory
    }
    
    struct Payload {
        
    }
    
    private let dependency: Dependency
    private let payload: Payload
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.addSubview((self.subviews?.button)!)
        
        self.reactor = self.dependency.reactorFactory.create(
            payload: RootReator.Payload.init(
                root: self
            )
        )
    }
    
    override func viewDidLayoutSubviews() {
        self.subviews?.updateSubviewConstraint()
    }
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
        
        super.init(nibName: nil, bundle: nil)
        
        self.subviews = self.dependency.subviewFactory.create(
            payload: RootViewControllerSubview.Payload.init(root: self)
        )
    }
    
}

extension RootViewController {
    func bind(reactor: RootReator) {
        
        self.subviews?.button.rx.tap
            .map { Reactor.Action.didClick }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
    }
}
