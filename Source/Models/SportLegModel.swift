//
//  SportLegModel.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/11/22.
//

import Combine

class SportLegModel: ObservableObject {
    let name: String
    @Published var totalTime: TimeModel
    
    var splitTime: TimeModel {
        return totalTime.times(2)
    }
    
    var cancellable1 : AnyCancellable?
    var cancellable2 : AnyCancellable?
    var cancellable3 : AnyCancellable?
    
    init(name: String, totalTime: TimeModel) {
        self.name = name
        self.totalTime = totalTime
    }
}
