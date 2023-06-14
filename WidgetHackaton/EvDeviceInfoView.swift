//
//  EvDeviceInfoView.swift
//  SpotpriceWidgetExtension
//
//  Created by Rajkumar Sharma on 14/06/23.
//

import SwiftUI

struct EvDeviceInfoView: View {
    
    
    
    var info: DeviceInfo
    var imageSize = 60.0
    var iconPadding = 7.0
    
    var body: some View {
        VStack(spacing: 5) {
            CenterView
            VStack(spacing: 0) {
                Text(info.type.name).font(Font.system(size: 9))
                Text(info.status.text).font(Font.system(size: 9))
                    .foregroundColor(.gray)
            }
        }.frame(maxHeight: 120)
    }
    
    
    var CenterView: some View {
        ZStack {
            info.type.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize, height: imageSize)
                .clipped()
            VStack {
                info.status.image
                    .resizable()
                    .foregroundColor(info.status.foreground)
                    .frame(width: 12, height: 12)
                    .clipped()
                Spacer()
            }.padding(.top, iconPadding)
            
            VStack {
                Circle()
                    .trim(from: 0.125, to: 1)
                    .rotation(.degrees(247))
                    .stroke(Color.gray.opacity(0.25), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .frame(width: imageSize - 4)
                
            }.padding(.top, iconPadding/2 + 6)
            
            VStack {
                Circle()
                    .trim(from: 0.125, to: info.type.chargingStatus)
                    .rotation(.degrees(247))
                    .stroke(info.status.statusColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .frame(width: imageSize - 4)
                
            }.padding(.top, iconPadding/2 + 6)
        }
        .frame(width: 65, height: 70)
        .clipped()
        
    }
}

struct EvDeviceInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let devices = DeviceInfo.getAll()
        EvDeviceInfoView(info: devices[0])
    }
}
