//
//  HomePageView.swift
//  LapCounter
//
//  Created by Richie Glennon on 2/10/23.
//

import SwiftUI

struct HomePageView: View {
    @State private var showingWorkoutView = false
    @State private var credits = false
    @State private var showingRaceView = false
    @State var showingsheet = !UserDefaults.standard.welcomeScreenShown
    var body: some View {
        NavigationView{
            ZStack{
                VStack (spacing: 20) {
                    Button(action: { self.showingRaceView = true }) {
                        Text("Start a Race")
                            .bold()
                    }
                    Button(action: { showingWorkoutView.toggle() }) {
                        Text("Start a Workout")
                    }
                    Button(action: { credits.toggle() }) {
                        Text("Credits")
                    }
                    NavigationLink(destination: RaceCounterView(stopwatch: StopWatch(), viewModel: RaceCounterViewModel()), isActive: $showingRaceView) { EmptyView() }
                    NavigationLink(destination: CreditView(), isActive: $credits) { EmptyView() }
                    NavigationLink(destination: Text("didnt make this one yet"), isActive: $showingWorkoutView) { EmptyView() }
                }
                .sheet(isPresented: $showingsheet) {
                    WelcomeScreenCarousel()
                }
            }
        }
    }    
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
