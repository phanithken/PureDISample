//
//  HomeViewController.swift
//  PureDISample
//
//  Created by ken.phanith on 2019/01/31.
//  Copyright © 2019 PK. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import Pure

class HomeViewController: UIViewController, FactoryModule, View {
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    typealias Reactor = HomeReactor
    var disposeBag: DisposeBag = DisposeBag()
    
    private var subviews: HomeSubview?
    
    struct Dependency {
        let reactor: HomeReactor.Factory
        let subview: HomeSubview.Factory
    }
    
    struct Payload {
        
    }
    
    let dependency: Dependency
    let payload: Payload
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        self.subviews = self.dependency.subview.create(
            payload: HomeSubview.Payload.init(home: self)
        )
        
        self.reactor = self.dependency.reactor.create(
            payload: HomeReactor.Payload.init(home: self)
        )
        
        self.view.addSubview((self.subviews?.incrementBtn)!)
        self.view.addSubview((self.subviews?.decrementBtn)!)
        self.view.addSubview((self.subviews?.countIndicator)!)
    }
    
    override func viewDidLayoutSubviews() {
        self.subviews?.updateSubviewConstraints()
    }
    
    required init(dependency: Dependency, payload: Payload) {
        self.dependency = dependency
        self.payload = payload
        
        super.init(nibName: nil, bundle: nil)
    }
}

extension HomeViewController {
    func bind(reactor: HomeReactor) {
        
        self.subviews?.incrementBtn.rx.tap
            .map { Reactor.Action.Increment }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.subviews?.decrementBtn.rx.tap
            .map { Reactor.Action.Decrement }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.reactor?.state
            .map { $0.count }
            .bind(to: self.subviews?.countIndicator.rx.text)
            .disposed(by: self.disposeBag)
    }
}
