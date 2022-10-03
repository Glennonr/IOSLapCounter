//
//  RunnersView.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import SwiftUI

struct RunnersView: View {
    @Binding var runners: [Runner]
    @State private var isPresentingEditView = false
    @State private var newRunnerData = Runner.Data()
    @StateObject var stopWatch: StopWatch
    
    var body: some View {
            List{
                Button("ADD A RUNNER"){
                    isPresentingEditView = true
                }
                .sheet(isPresented: $isPresentingEditView) {
                    NavigationView {
                        DetailEditView(data: $newRunnerData)
                            .navigationTitle("New Runner")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isPresentingEditView = false
                                        newRunnerData = Runner.Data()
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        isPresentingEditView = false
                                        let newRunner = Runner(name: newRunnerData.name, team: newRunnerData.team, lapsToGo: newRunnerData.lapsToGo, lastSplit: newRunnerData.lastSplit)
                                        runners.append(newRunner)
                                        newRunnerData = Runner.Data()
                                    }
                                }
                            }
                    }
                }
                .frame(alignment: .trailing)
                ForEach($runners){ runner in
                    RowView(runner: runner, stopWatchTime: $stopWatch.stopWatchTime)
                }
                .onDelete { indices in
                    runners.remove(atOffsets: indices)
                }
                }
        }
    }
struct RunnersView_Previews: PreviewProvider {
    static var previews: some View {
        RunnersView(runners: .constant(Runner.sampleData), stopWatch: StopWatch())
    }
}
