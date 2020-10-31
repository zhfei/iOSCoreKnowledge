//
//  GenericUI.swift
//  CKSwift
//
//  Created by zhoufei on 2020/10/31.
//  Copyright © 2020 zhf. All rights reserved.
//

import SwiftUI

struct GenericUI: View {
    let generic = Generic()
    var body: some View {
        List {
            Button(action: {
                self.generic.showDragons(dragons: self.generic.dragonNames)
                self.generic.showDragons(dragons: self.generic.dragonIds)
                self.generic.showDragons(dragons: self.generic.dragonNames)
            }, label: {Text("1.2.0泛型概念")})
            Button(action: {
                _ = HTNTransition(event: UIEvent(), fromState: "from", toState: "to")
            }, label: {Text("1.2.1类型约束")})
        }
    }
}

struct GenericUI_Previews: PreviewProvider {
    static var previews: some View {
        GenericUI()
    }
}
