//
//  TransitionModel.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/9/22.
//

import Combine

class TransitionModel: ObservableObject {
    @Published var name: String
    @Published var time: TimeModel
    
    init(name: String, time: TimeModel) {
        self.name = name
        self.time = time
    }
}
