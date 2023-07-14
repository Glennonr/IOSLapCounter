//
//  CreditView.swift
//  LapCounter
//
//  Created by Richie Glennon on 2/10/23.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack(spacing: 20){
            Text("Inspired by every track athlete and coach's biggest fear")
                .font(.title)
                .padding(.top, 30)
            Text("LOSING COUNT OF LAPS")
                .font(.title)
                .bold()
                .padding(.bottom, 30)
            Text("Originally an Android App created by")
                HStack(alignment: .center){
                        Image("Dom Roster")
                            .frame(width: 30)
                        Image("Richie Roster")
                            .frame(width: 30)
                        Image("Shane Roster")
                            .frame(width: 30)
                }
            
            Text("iOS implementation by Richie Glennon")
                .padding(.top, -80)
            Spacer()
            Text("Want to contribute or check it out for yourself?")
            Text("https://github.com/Glennonr/IOSLapCounter")
                .padding(.bottom, 30)
        }
        .navigationBarTitle("Behind the Scenes", displayMode: .inline)
        .padding(.horizontal, 20)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
