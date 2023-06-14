//
//  SpotpriceWidgetBundle.swift
//  SpotpriceWidget
//
//  Created by Jacob Fredriksson on 2023-06-14.
//

import WidgetKit
import SwiftUI

@main
struct SpotpriceWidgetBundle: WidgetBundle {
    var body: some Widget {
        SpotpriceWidget()
        SpotpriceWidgetLiveActivity()
        EvDevicesWidget()
        EvDeviceWidgetSmall()
    }
}
