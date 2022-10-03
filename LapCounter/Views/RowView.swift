//
//  RowView.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import SwiftUI

struct RowView: View {
    @Binding var runner: Runner
    @Binding var stopWatchTime: String
    var body: some View {
        HStack{
            VStack{
                Text(runner.name)
                Text(runner.team)
            }
            Spacer()
            
            VStack{
                Text("Split")
                Text("\(runner.lastSplit)")
            }
            Spacer()
            
            VStack{
                Text("laps Left")
                Text("\(runner.lapsToGo)")
            }
            Spacer()
            
            Button("Lap", action:{
                if let lapsToGo = Double(runner.lapsToGo), lapsToGo > 0 {
                    runner.lastSplit = stopWatchTime
                }
                runner.lap()
            })
            .padding(.horizontal)
        }
        .background(Double(runner.lapsToGo) == 0 ? .green: .clear)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(runner: .constant(Runner.sampleData[0]), stopWatchTime: .constant("00:00:00"))
            .previewLayout(.fixed(width:400, height:40))
    }
}
