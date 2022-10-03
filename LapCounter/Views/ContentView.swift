//
//  ContentView.swift
//  LapCounter
//
//  Created by Richie Glennon on 6/22/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var runners: [Runner]
    @ObservedObject var stopwatch: StopWatch = StopWatch()
    var body: some View {
        VStack{
            StopWatchView(stopWatch: stopwatch)
            RunnersView(runners: $runners, stopWatch: stopwatch)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(runners: .constant(Runner.sampleData))
    }
}
