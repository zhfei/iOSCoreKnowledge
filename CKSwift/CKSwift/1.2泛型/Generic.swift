//
//  generic.swift
//  CKSwift
//
//  Created by zhoufei on 2020/10/31.
//  Copyright © 2020 zhf. All rights reserved.
//

import Foundation

///!!!:  1.泛型概念
class Generic: NSObject {
    let dragonNames = ["red dragons","white dragons","blue dragons"]
//    func showDragons(dragons: [String]) {
//        print("String执行方法：showDragons")
//        for dragon in dragons {
//            print("\(dragon)")
//        }
//        print("\n")
//    }
    
    let dragonIds = [3305,3308,3309]
//    func showDragons(dragons:[Int]) {
//        print("Int执行方法：showDragons")
//        for dragon in dragons {
//            print("\(dragon)")
//        }
//        print("\n")
//    }
    
    //使用泛型，可以用一个方法代替上面两个方法
    func showDragons<T>(dragons:[T]) {
        print("泛型方法：showDragons")
        for dragon in dragons {
            print("\(dragon)")
        }
        print("\n")
    }
    
}

///!!!:  2.类型约束
struct HTNTransition<S: Hashable, E: Hashable> {
    
    let event: E
    let fromState: S
    let toState: S
    
    //构造函数中传入的两种参数必须都遵守协议Hashable
    init(event: E, fromState: S, toState: S) {
        self.event = event
        self.fromState = fromState
        self.toState = toState
        
        if fromState == toState {
            print("Two State is same!")
        } else {
            print("Two State is not same!")
        }
    }
}

///!!!:  3.关联类型
protocol HTNState {
    //associatedtype关联类型，帮助协议实现泛型。在协议中定义一个占位符，真正使用时才确定具体的类型
    associatedtype StateType
    func add(_ item: StateType)
}

struct states: HTNState {
    //typealias类型重命名（将Int重命名为StateType），为了方便阅读
    typealias StateType = Int
    //非泛型实现
    func add(_ item: Int) {
        
    }
}

struct states2<T>: HTNState {
    //泛型实现
    func add(_ item: T) {
        
    }
}


///!!!:  4.类型擦除
class stateDelegate<T> {
    var state: T
    //报错原因是：HTNState协议使用了associatedtype，只能作为泛型约束用，不能作为属性。
    //解决方法：抽象类型具体化，参考AnySequence协议
//    var delegate: HTNState
    
    init(_ state: T) {
        self.state = state
    }
    
}


///!!!:  5.where语句
class StateWhere: NSObject {
    //where针对泛型使用时的一种约束
    func stateFilter<FromState: HTNState, ToState: HTNState>(_ from: FromState, _ to: ToState) where FromState.StateType == ToState.StateType  {
        
    }
}


class AnyGenneric: NSObject {
    //泛型既灵活又安全
    func add<T>(_ input: T) -> T {
        //....
        //代码逻辑
        //input还是T类型
        return input;
    }
    
    //any会避过类型检查，不安全；
    func anyAdd(_ input: Any) -> Any {
        //....
        //代码逻辑
        //input可能不是参数传过来时的类型
        return input;
    }
}
