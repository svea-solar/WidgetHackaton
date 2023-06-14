//
//  EvDevicesWidget.swift
//  WidgetHackaton
//
//  Created by Rajkumar Sharma on 14/06/23.
//

import WidgetKit
import SwiftUI
import Intents

struct EvDeviceProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


struct EvDevicesWidgetEntryView : View {
    var entry: EvDeviceProvider.Entry
    var deviceInfo = DeviceInfo.getAll()
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Your devices").font(Font.system(size: 12))
            HStack(spacing: 16) {
                ForEach(deviceInfo, id: \.id) { info in
                    EvDeviceInfoView(info: info)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }
}

struct EvDevicesWidget: Widget {
    let kind: String = "EVDevicesWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: EvDeviceProvider()) { entry in
            EvDevicesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Ev Devices")
        .description("See live status of your devices.")
        .supportedFamilies([.systemMedium])
    }
}

struct EvDevicesWidget_Previews: PreviewProvider {
    static var previews: some View {
        EvDevicesWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
