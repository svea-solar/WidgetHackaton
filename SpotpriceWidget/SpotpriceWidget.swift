//
//  SpotpriceWidget.swift
//  SpotpriceWidget
//
//  Created by Jacob Fredriksson on 2023-06-14.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
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

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct SpotpriceWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        //Doing ui here
        VStack {
            VStack(alignment: .center) {
                Text("Status right now")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Text("Low spot price")
                    .font(.caption)
                
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Solvägen")
                        .foregroundColor(.white)
                        .font(.caption)
    
                    Image("SpotPriceLow")
                        .offset(y: 10)
                }
                
                Text("84 öre")
                    .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                    .font(.caption)
                    .offset(y: -10)
            }
            .padding(.horizontal, 25)
            .background(.black)
            .cornerRadius(16)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 5)
        )
        
    }
}

struct SpotpriceWidget: Widget {
    let kind: String = "SpotpriceWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SpotpriceWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Spot price")
        .description("See current spot price")
        .supportedFamilies([.systemSmall])
    }
    
}

struct SpotpriceWidget_Previews: PreviewProvider {
    static var previews: some View {
        SpotpriceWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
            
    }
}
