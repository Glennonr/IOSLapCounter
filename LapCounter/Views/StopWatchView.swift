//
//  StopWatchView.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import SwiftUI

struct StopWatchView: View {
    @StateObject var stopWatch: StopWatch
    
    var body: some View {
        VStack{
            HStack{
                Text(self.stopWatch.stopWatchTime)
                    .font(.custom("courier", size: 40))
                    .frame(width: UIScreen.main.bounds.size.width / 2,
                           height: 100,
                           alignment: .center)
                HStack{
                StopWatchButton(actions: [self.stopWatch.reset, self.stopWatch.pass],
                                labels: ["Reset", "Reset"],
                                color: Color.red,
                                isPaused: self.stopWatch.isPaused())
                    
                StopWatchButton(actions: [self.stopWatch.start, self.stopWatch.pause],
                                labels: ["Start", "Pause"],
                                color: Color.blue,
                                isPaused: self.stopWatch.isPaused())
                }
            }
    }
}
    
    struct StopWatchButton : View {
        var actions: [() -> Void]
        var labels: [String]
        var color: Color
        var isPaused: Bool
        
        var body: some View {
            let buttonWidth = (UIScreen.main.bounds.size.width / 4) - 12
            
            return Button(action: {
                if self.isPaused {
                    self.actions[0]()
                } else {
                    self.actions[1]()
                }
            })
            {
                if isPaused {
                    Text(self.labels[0])
                        .foregroundColor(Color.white)
                        .frame(width: buttonWidth,
                               height: 50)
                } else {
                    Text(self.labels[1])
                        .foregroundColor(Color.white)
                        .frame(width: buttonWidth,
                               height: 50)
                }
            }
            .background(self.color)
        }
    }

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView(stopWatch: StopWatch())
    }
}
}
