//
//  StatusData.swift
//  WidgetDemo
//
//  Created by 朱廷 on 2020/6/28.
//  Copyright © 2020 TZ. All rights reserved.
//

import Foundation
import SwiftUI

struct StatusData {
    var progress: CGFloat
    var isCharging: Bool
    
    static var demo: StatusData {
        StatusData(progress: 0.0, isCharging: false)
    }
}
