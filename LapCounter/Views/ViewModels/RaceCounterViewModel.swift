//
//  RaceCounterViewModel.swift
//  LapCounter
//
//  Created by Richie Glennon on 6/5/23.
//

import Foundation

class RaceCounterViewModel: ObservableObject {
    @Published var runners: [Runner] = []
    @Published var isPresentingReportView = false
    @Published var showingAlert = false
    
    init(runners: [Runner], isPresentingReportView: Bool = false, showingAlert: Bool = false) {
        self.runners = runners
        self.isPresentingReportView = isPresentingReportView
        self.showingAlert = showingAlert
    }
    
    init() { }
    
    func deleteStoredData() {
        runners = []
    }
}
