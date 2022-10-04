//
//  ReportRowView.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import SwiftUI

struct ReportRowView: View {
    @Binding var runner: Runner

    var body: some View {
        HStack{
                Text(runner.name)
                .bold()
            ForEach(runner.splits, id: \.self){ splite in
                let index = runner.splits.firstIndex(of: splite)
                VStack{
                    Text("\(index! + 1)")
                        
                    Text(splite)
                }
            }
            Spacer()
        }
    }
}

struct ReportRowView_Previews: PreviewProvider {
    static var previews: some View {
        ReportRowView(runner: .constant(Runner.sampleData[0]))
            .previewLayout(.fixed(width:400, height:80))
    }
}
