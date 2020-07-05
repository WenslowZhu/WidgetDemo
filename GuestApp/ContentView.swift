//
//  ContentView.swift
//  GuestApp
//
//  Created by 朱廷 on 2020/7/3.
//  Copyright © 2020 TZ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Hello, world!").padding()
                .tabItem {
                    Image(systemName: "12.circle.fill")
                    Text("主页")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
