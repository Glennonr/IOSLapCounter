//
//  DetailEditView.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import SwiftUI
import Combine

struct DetailEditView: View {
    @Binding var data: Runner.Data
    
    var body: some View {
        Form{
            Section(header: Text("Runner Info")) {
                TextField("Name", text: $data.name)
                TextField("Team", text: $data.team)
                TextField("Laps", text: $data.lapsToGo)
                    .keyboardType(.decimalPad)
                    .onReceive(Just(data.lapsToGo)) { newValue in
                        let filtered = newValue.filter { "0123456789.".contains($0) }
                        if filtered != newValue {
                            data.lapsToGo = filtered
                        }
                    }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Runner.sampleData[0].data))
    }
}
