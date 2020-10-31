//
//  ContentView.swift
//  CKSwift
//
//  Created by zhoufei on 2020/10/31.
//  Copyright © 2020 zhf. All rights reserved.
//
//  http://kmanong.top/kmn/qxw/form/article?id=76482&cate=63

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: GenericUI()) {
                    Text("1.2泛型")
                }
                NavigationLink(destination: GenericUI()) {
                    Text("1.3集合")
                }
            }.navigationBarTitle(Text("iOS梳理核心知识"))
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
