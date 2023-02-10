//
//  HomePageView.swift
//  LapCounter
//
//  Created by Richie Glennon on 2/10/23.
//

import SwiftUI

struct HomePageView: View {
    @Binding var runners: [Runner]
    @ObservedObject var stopwatch: StopWatch = StopWatch()
    @State private var howTo = false
    @State private var credits = false
    @State private var nextView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                
                
                NavigationLink(destination: ContentView(runners: $runners, stopwatch: stopwatch), isActive: $nextView) {
                    EmptyView()
                }
                NavigationLink(destination: CreditView(), isActive: $credits) {
                    EmptyView()
                }
                
                NavigationLink(destination: Text("didnt make this one yet"), isActive: $howTo) {
                    EmptyView()
                }
                
                Image("Track Photo").resizable().aspectRatio(contentMode: .fill).edgesIgnoringSafeArea(.all)
                
                Rectangle().foregroundColor(.clear).background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .bottom, endPoint: .top)).edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 20) {
                    Text("MUXCTF").font(.title).fontWeight(.heavy)
                    Spacer()
                    VStack {
                        Text("Never Lose Track of Laps Again").font(.system(size: 40, design: .monospaced)).fontWeight(.heavy).multilineTextAlignment(.center)
                    }
                    .padding(.vertical, 20)
                    
                    Text("Record splits and count laps all in one place. Keep racing the hardest part.").multilineTextAlignment(.center)
                    
                    Button(action: {
                        self.nextView = true
                    }) {
                        Text("Runners On Your Mark!")
                            .bold()
                    }.frame(width: 300, height: 60).background(Color.black)
                        .padding(.bottom, 40)
                    
                    Button(action: {
                        howTo.toggle()
                    }) {
                        Text("How to Guide")
                    }.frame(width: 300, height: 30).background(Color.black)
                    
                    Button(action: {
                        credits.toggle()
                    }) {
                        Text("Behind the Scenes")
                    }.frame(width: 300, height: 30).background(Color.black)
                        .padding()
                        .padding(.top, -30)
                }.frame(width: UIScreen.main.bounds.width - 40).foregroundColor(.white)
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(runners: .constant(Runner.sampleData))
    }
}
