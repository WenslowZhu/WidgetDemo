//
//  ContentView.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/6/28.
//  Copyright © 2020 TZ. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var data: StatusData
    
    static let gradientStart = ColorUtility.blue03.color
    static let gradientEnd = ColorUtility.blue01.color

    static let strokeLineWidth: CGFloat = 7
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()// 渐变
                .fill(LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0.2, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)))
            
            VStack() {
                ZStack {
                    Circle()
                        .stroke(lineWidth: Self.strokeLineWidth)
                        .foregroundColor(ColorUtility.gray01.color)
                        .opacity(0.3)
                    
                    Circle()
                        .trim(from: 0.0, to: data.progress)
                        .stroke(style: StrokeStyle(lineWidth: Self.strokeLineWidth,
                                           lineCap: .round,
                                           lineJoin: .round))
                        .foregroundColor(ColorUtility.green01.color)
                        .rotationEffect(Angle(degrees: -90))
                        .animation(Animation.easeInOut(duration: 1))
                                
                    Image(systemName: "car.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30, alignment: .center)
                    
                    if data.isCharging {
                        Text("⚡️")
                            .offset(y: -38)
                            .transition(AnyTransition.opacity.animation(Animation.easeInOut(duration: 1)))
                    }
                }
                .frame(height: 80)
                .padding()

                Text(String(format: "%.0f", data.progress * 100) + "%").font(.headline)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.data.progress = 0.9
                self.data.isCharging = true
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: StatusData.demo)
            .previewLayout(.fixed(width: 169, height: 169))
    }
}
