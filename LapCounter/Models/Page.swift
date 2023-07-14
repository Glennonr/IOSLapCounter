//
//  Page.swift
//  LapCounter
//
//  Created by Richie Glennon on 7/13/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageURL: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description", imageURL: "Shane Roster", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to Lap Counter", description: "Here's a quick how to", imageURL: "Track Photo", tag: 0),
        Page(name: "Is it a race or workout?", description: "Races have 1 shared stopwatch, and workouts have individual stopwatches", imageURL: "Choose an Option", tag: 1),
        Page(name: "Add your runners", description: "Click add a runner to fill up your race", imageURL: "Add a Runner", tag: 2),
        Page(name: "On Your Mark!", description: "Click the start button when the race starts and the lap button when each runner finishes a lap", imageURL: "On Your Marks", tag: 3),
        Page(name: "Your Turn!", description: "", imageURL: "", tag: 4),
    ]
}
