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
                                color1: Color.red,
                                color2: Color.clear,
                                foregroundColor2: Color.clear,
                                isPaused: self.stopWatch.isPaused())
                    .cornerRadius(10)
                    
                StopWatchButton(actions: [self.stopWatch.start, self.stopWatch.pause],
                                labels: ["Start", "Stop"],
                                color1: Color.blue,
                                color2: Color.red,
                                isPaused: self.stopWatch.isPaused())
                    .cornerRadius(10)
                }
            }
    }
}
    
    struct StopWatchButton : View {
        var actions: [() -> Void]
        var labels: [String]
        var color1: Color
        var color2: Color
        var foregroundColor: Color = Color.white
        var foregroundColor2: Color = Color.white
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
                        .foregroundColor(foregroundColor)
                        .frame(width: buttonWidth,
                               height: 50)
                } else {
                    Text(self.labels[1])
                        .foregroundColor(foregroundColor2)
                        .frame(width: buttonWidth,
                               height: 50)
                }
            }
            .background(self.isPaused ? color1 : color2)
        }
    }

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchView(stopWatch: StopWatch())
            .previewLayout(.fixed(width:400, height:100))
    }
}
}
