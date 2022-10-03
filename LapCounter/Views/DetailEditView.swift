//
//  DetailEditView.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: Runner.Data
    
    var body: some View {
        Form{
            Section(header: Text("Runner Info")) {
                TextField("Name", text: $data.name)
                TextField("Team", text: $data.team)
                TextField("Laps", text: $data.lapsToGo)
                    .keyboardType(.decimalPad)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Runner.sampleData[0].data))
    }
}
