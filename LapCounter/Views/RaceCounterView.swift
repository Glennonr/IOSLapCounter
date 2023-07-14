//
//  RaceCounterView.swift
//  LapCounter
//
//  Created by Richie Glennon on 6/22/22.
//

import SwiftUI

struct RaceCounterView: View {
    @ObservedObject var stopwatch: StopWatch
    @ObservedObject var viewModel: RaceCounterViewModel
    var body: some View {
        VStack{
            StopWatchView(stopWatch: stopwatch)
            RunnersView(runners: $viewModel.runners, stopWatch: stopwatch)
            HStack{
                Button{
                    viewModel.showingAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .disabled(shouldBeDisabled())
                .alert(isPresented: $viewModel.showingAlert) {
                    Alert(
                        title: Text("Are you sure?"),
                        message: Text("This will delete all data, there is no undo"),
                        primaryButton: .destructive(Text("Reset")) {
                            viewModel.deleteStoredData()
                            stopwatch.reset()
                        },
                        secondaryButton: .cancel())
                }
                Spacer()
                Button("Show Results"){
                    stopwatch.pause()
                    viewModel.isPresentingReportView.toggle()
                }
                .disabled(shouldBeDisabled())
                .sheet(isPresented: $viewModel.isPresentingReportView) {
                    NavigationView {
                        ReportView(runners: $viewModel.runners)
                            .navigationTitle("Results")
                            .toolbar {
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Done") {
                                        viewModel.isPresentingReportView = false
                                    }
                                }
                            }
                    }
                }
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 40)
        }
        .onDisappear {
            stopwatch.reset()
            viewModel.deleteStoredData()
        }
    }
    
    func shouldBeDisabled() -> Bool {
        (!stopwatch.isPaused()) || (viewModel.runners.count < 1)
    }

}

struct RaceCounterView_Previews: PreviewProvider {
    static var previews: some View {
        RaceCounterView(stopwatch: StopWatch(), viewModel: RaceCounterViewModel())
    }
}
