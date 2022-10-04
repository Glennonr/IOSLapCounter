//
//  ReportView.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import SwiftUI
import Foundation

struct ReportView: View {
    @Binding var runners: [Runner]
    var body: some View {
        VStack{
        List {
            ForEach($runners){ runner in
                ScrollView(.horizontal){
                ReportRowView(runner: runner)
                }
            }
        }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(runners: .constant(Runner.sampleData))
    }
}
