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
    @State private var isPresentingReportView = false
    var body: some View {
        VStack{
            StopWatchView(stopWatch: stopwatch)
            RunnersView(runners: $runners, stopWatch: stopwatch)
            Button("Get Results Report"){
                isPresentingReportView = true
                stopwatch.pause()
            }
            .padding(.bottom, 10)
            .sheet(isPresented: $isPresentingReportView) {
                NavigationView {
                    ReportView(runners: $runners)
                        .navigationTitle("Results")
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingReportView = false
                                }
                            }
                        }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(runners: .constant(Runner.sampleData))
    }
}
