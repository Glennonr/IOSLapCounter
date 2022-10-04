/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct Runner: Identifiable {
    let id: UUID
    var name: String
    var team: String
    var lapsToGo: String
    var lastSplit: String
    var splits: [String] = []
    
    init(id: UUID = UUID(), name: String, team: String, lapsToGo: String, lastSplit: String) {
        self.id = id
        self.name = name
        self.team = team
        self.lapsToGo = lapsToGo
        self.lastSplit = lastSplit
    }
    
    init(id: UUID = UUID(), name: String, team: String, lapsToGo: String, lastSplit: String, splits: [String]) {
        self.id = id
        self.name = name
        self.team = team
        self.lapsToGo = lapsToGo
        self.lastSplit = lastSplit
        self.splits = splits
    }
    
    mutating func lap(currentTime: String) {
        if var lapsDouble = Double(self.lapsToGo) {
            if lapsDouble > 0 {
                lastSplit = currentTime
                if lapsDouble.truncatingRemainder(dividingBy: 1) == 0 {
                    lapsDouble = lapsDouble - 1
                } else {
                    lapsDouble = lapsDouble - 0.5
                }
                splits.append(lastSplit)
                print(splits)
                self.lapsToGo = String(format: "%.0f", lapsDouble)
            }
        }
    }
    
    mutating func update(name:String, team:String, lapsToGo: String) {
        self.name = name
        self.team = team
        self.lapsToGo = lapsToGo
    }
}


extension Runner {
    
    struct Data {
        var name: String = ""
        var team: String = ""
        var lapsToGo: String = ""
        var lastSplit: String = ""
    }
    
    var data: Data {
        Data(name: name, team:team, lapsToGo:lapsToGo, lastSplit: lastSplit)
    }
    
    mutating func update(from data:Data) {
        name = data.name
        team = data.team
        lapsToGo = data.lapsToGo
        lastSplit = data.lastSplit
    }
    
    init(data: Data) {
        id = UUID()
        name = data.name
        team = data.team
        lapsToGo = data.lapsToGo
        lastSplit = data.lastSplit
    }
    
    static let sampleData: [Runner] =
    [
        Runner(name: "Dom", team: "Moravian", lapsToGo: "4", lastSplit: "00:00:00", splits: ["split1", "split2", "split3", "split4",]),
        Runner(name: "Shane", team: "Moravian", lapsToGo: "4", lastSplit: "00:00:00"),
        Runner(name: "Richie", team: "Moravian", lapsToGo: "4", lastSplit: "00:00:00")
    ]
}
