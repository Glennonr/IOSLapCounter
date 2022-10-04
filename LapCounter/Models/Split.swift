//
//  Split.swift
//  LapCounter
//
//  Created by Richie Glennon on 10/3/22.
//

import Foundation

struct Split: Identifiable{
    let id: UUID
    let time: String
    
    init(id: UUID = UUID(), time: String) {
        self.id = id
        self.time = time
    }
}
