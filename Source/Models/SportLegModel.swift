//
//  SportLegModel.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/11/22.
//

import Combine

class SportLegModel: ObservableObject {
    let name: String
    @Published var splitTime: TimeModel
    @Published var totalTime: TimeModel
    
    private var cancellable1: Cancellable?
    private var cancellable2: Cancellable?
    
    init(name: String, splitTime: TimeModel) {
        self.name = name
        self.splitTime = splitTime
        self.totalTime = splitTime.times(2)
        
        cancellable1 = totalTime.$hours.combineLatest(totalTime.$minutes, totalTime.$seconds).sink { [weak self] (newHours, newMinutes, newSeconds) in
            guard let self = self else { return }
            
            let newTime = TimeModel(hours: newHours, minutes: newMinutes, seconds: newSeconds).divideBy(2)
            self.splitTime.hours = newTime.hours
            self.splitTime.minutes = newTime.minutes
            self.splitTime.seconds = newTime.seconds
        }
        
        cancellable2 = splitTime.$hours.combineLatest(splitTime.$minutes, splitTime.$seconds).sink { [weak self] (newHours, newMinutes, newSeconds) in
            guard let self = self else { return }
            
            let newTime = TimeModel(hours: newHours, minutes: newMinutes, seconds: newSeconds).times(2)
            self.totalTime.hours = newTime.hours
            self.totalTime.minutes = newTime.minutes
            self.totalTime.seconds = newTime.seconds
        }
    }
}
