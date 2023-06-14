//
//  ChargingLargeWidget.swift
//  WidgetHackaton
//
//  Created by Shivam Saini on 14/06/2023.
//

import SwiftUI
import WidgetKit

struct ChargingLargeWidgetView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Range")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.black)
                    Text("84 Km")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.black)
                }
                Spacer()
                HStack {
                    Image("protectiveCharging")
                    Text("Protective charging")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 9)
                .padding(.vertical, 7)
                .background(Color(red: 0.997, green: 0.866, blue: 0.212))
                .cornerRadius(4)
            }
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Battery")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(red: 0.012, green: 0.51, blue: 0.302))
                HStack(alignment: .bottom) {
                    Text("74")
                        .font(.system(size: 40, weight: .light))
                        .foregroundColor(Color(red: 0.012, green: 0.51, blue: 0.302))
                    Text("%")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color(red: 0.012, green: 0.51, blue: 0.302))
                        .padding(.bottom, 8)
                        .padding(.leading, -4)
                }
            }
            HStack {
                
            }
        }
        .padding(20)
        .padding(.bottom, 0)
        .background(Image("Car"))
    }
}

struct CustomProgressBar: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack(alignment: .leading) {
                Rectangle().frame(width: UIScreen.main.bounds.width, height: 12)
                    .opacity(0.3)
                Rectangle().frame(width: 300 * CGFloat(configuration.fractionCompleted ?? 0.0), height: 10)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct ChargingLargeWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    var body: some View {
        //Doing ui here
        ChargingLargeWidgetView()
    }
}

struct ChargingLargeWidget: Widget {
    let kind: String = "ChargingLargeWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            ChargingLargeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Svea Widget")
        .description("Car charging widget.")
        .supportedFamilies([.systemLarge])
    }
}

struct ChargingLargeWidget_Previews: PreviewProvider {
    static var previews: some View {
        ChargingLargeWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
