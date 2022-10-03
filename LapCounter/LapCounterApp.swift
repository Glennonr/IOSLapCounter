//
//  LapCounterApp.swift
//  LapCounter
//
//  Created by Richie Glennon on 6/22/22.
//

import SwiftUI

@main
struct LapCounterApp: App {
    
    @State private var runners: [Runner] = []
    @ObservedObject private var stopWatch: StopWatch = StopWatch()
    
    var body: some Scene {
        WindowGroup {
            ContentView(runners: $runners)
        }
    }
}
