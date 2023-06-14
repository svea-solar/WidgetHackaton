//
//  EvDeviceConfiguration.swift
//  SpotpriceWidgetExtension
//
//  Created by Rajkumar Sharma on 14/06/23.
//

import Foundation
import SwiftUI

enum EvDeviceTypes {
    
    case roof
    case car
    case charger
    
    
    var image: Image {
        switch self {
        case .roof:
            return Image("EvRoof")
        case .car:
            return Image("EvCar")
        case .charger:
            return Image("EvCharger")
        }
    }
    
    var chargingStatus: CGFloat {
        switch self {
        case .roof:
            return 0.85
        case .car:
            return 0.6
        case .charger:
            return 0.2
        }
    }
    
    var name: String {
        switch self {
        case .roof:
            return "My Order"
        case .car:
            return "My Polestar"
        case .charger:
            return "My Wallbox"
        }
    }
}

enum EvDeviceStatus {
    
    case notCharging
    case charging
    case paused
    case error
    
    var image: Image {
        switch self {
        case .notCharging:
            return Image(systemName: "bell.circle.fill")
        case .charging:
            return Image(systemName: "bolt.circle.fill")
        case .paused:
            return Image(systemName: "pause.circle.fill")
        case .error:
            return Image(systemName: "exclamationmark.circle.fill")
        }
    }
    
    var foreground: Color {
        switch self {
        case .error, .notCharging:
            return Color.red
        default:
            return Color.black
        }
    }
    
    var statusColor: Color {
        switch self {
        case .paused:
            return Color.black.opacity(0)
        case .charging:
            return Color.green
        case .error, .notCharging:
            return Color.red
            
        }
    }
    
    var text: String {
        switch self {
        case .charging:
            return "Smart Charging"
        case .paused, .notCharging:
            return "Not charging"
        case .error:
            return "Smart Charging"
        }
    }
}

struct DeviceInfo: Identifiable {
    
    var id: String = UUID().uuidString
    var type: EvDeviceTypes
    var status: EvDeviceStatus
    
    static func getAll() -> [DeviceInfo] {
        return [
            DeviceInfo(type: .roof, status: .error),
            DeviceInfo(type: .car, status: .charging),
            DeviceInfo(type: .charger, status: .paused)
        ]
    }
}
