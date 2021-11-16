//
//  Component.swift
//  ComponentKit
//
//  Created by Muhammad Hussaan Saeed on 10/8/21.
//

import UIKit

protocol AnyComponent {

    var view: UIView { get }
}


protocol AnyComponentInputs {
    associatedtype Model
    
    var update: (Model) -> Void { get }
}

protocol AnyComponentOutput {
    associatedtype EventHandler
    associatedtype Event
    
    var event: (EventHandler) -> Void { get }
}


public struct Component<Model, Event> {
    
    public var view: UIView
    public var update: (Model) -> Void
    public var event: ((Event) -> Void) -> Void
    
    public init(viewBuilder: @escaping () -> UIView,
                update: @escaping (Model) -> Void,
                eventHandler: @escaping ((Event) -> Void) -> Void) {
        self.view = viewBuilder()
        self.update = update
        self.event = eventHandler
    }
}
