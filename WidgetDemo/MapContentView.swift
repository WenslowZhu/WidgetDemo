//
//  MapContentView.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/6/29.
//  Copyright © 2020 TZ. All rights reserved.
//

import SwiftUI
import CoreLocation

struct MapContentView: View {
    
    var body: some View {
        ZStack {
            MapView()
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack(alignment: .bottom) {
                    ZStack {
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(ColorUtility.gray01.color)
                        
                        HStack {
                            Circle()
                                .foregroundColor(ColorUtility.yellow01.color)
                                .overlay(
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(13)
                                        .foregroundColor(.white))
                            
                            Circle()
                                .foregroundColor(ColorUtility.yellow01.color)
                                .overlay(
                                    Image(systemName: "car.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(13)
                                        .foregroundColor(.white))
                        }
                        .padding(8)
                    }
                    .frame(width: 140, height: 70)
                    
                    Spacer()
                }
                .padding()
            }
            
        }
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView()
            .previewLayout(.fixed(width: 360, height: 169))
    }
}

