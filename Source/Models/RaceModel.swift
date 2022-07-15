//
//  RaceModel.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/14/22.
//

import Combine

class RaceModel: ObservableObject {
    @Published var type = RaceTypeModel.raceTypes[0]
    
    @Published var swim = SportLegModel(
        name: "Swim",
        splitTime: TimeModel(hours: 0, minutes: 5, seconds: 0)
    )
    
    @Published var transition1 = TransitionModel(name: "Transition 1", time: TimeModel(hours: 0, minutes: 5, seconds: 0))
    
    @Published var bike = SportLegModel(
        name: "Bike",
        splitTime: TimeModel(hours: 0, minutes: 5, seconds: 0)
    )
    
    @Published var transition2 = TransitionModel(name: "Transition 2", time: TimeModel(hours: 0, minutes: 5, seconds: 0))
    
    @Published var run = SportLegModel(
        name: "Run",
        splitTime: TimeModel(hours: 0, minutes: 5, seconds: 0)
    )
    
    private var cancellable: Cancellable?
    
    init() {
        cancellable = transition1.$time.sink(receiveValue: { [weak self] _ in
            self?.objectWillChange.send()
        })
    }
    
    var totalTime: String {
        let times: [TimeModel] = [swim.totalTime, transition1.time, bike.totalTime, transition2.time, run.totalTime]
        let total = times.reduce(TimeModel(hours: 0, minutes: 0, seconds: 0)) { partialResult, nextTime in
            return partialResult.add(nextTime)
        }
        
        return total.hh_mm_ss_format
    }
}
