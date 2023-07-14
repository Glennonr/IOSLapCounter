//
//  LapCounterApp.swift
//  LapCounter
//
//  Created by Richie Glennon on 6/22/22.
//

import SwiftUI

extension UserDefaults {
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
}

@main
struct LapCounterApp: App {
    var body: some Scene {
        WindowGroup {
            HomePageView()
        }
    }
}
