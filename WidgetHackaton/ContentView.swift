//
//  ContentView.swift
//  WidgetHackaton
//
//  Created by Jacob Fredriksson on 2023-06-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack {
                Image(systemName: "laptopcomputer")
                    .imageScale(.large)
                    .font(.system(size: 60))
                    .foregroundColor(.pink)
                Spacer().frame(height: 20)
                VStack(spacing: 5) {
                    Text("Svea Widgets").font(.title)
                    Text("Hackathon!").font(.title2)
                }
            }
            Spacer()
            VStack(spacing: 5) {
                Text("14, June, 2023").font(.title3).foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
