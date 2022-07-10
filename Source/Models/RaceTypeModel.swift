//
//  RaceTypeModel.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/9/22.
//

struct RaceTypeModel: Hashable {
    var name: String
    var swimDistance: String
    var bikeDistance: String
    var runDistance: String
    
    static let raceTypes = [
        RaceTypeModel(
            name: "Iron Man",
            swimDistance: "2.4 miles",
            bikeDistance: "112 miles",
            runDistance: "26.2 miles"
        ),
        RaceTypeModel(
            name: "Half Iron Man",
            swimDistance: "1.2 miles",
            bikeDistance: "56 miles",
            runDistance: "13.1 miles"
        ),
        RaceTypeModel(
            name: "Olympic",
            swimDistance: "0.93 miles",
            bikeDistance: "24.8 miles",
            runDistance: "6.2 miles"
        ),
        RaceTypeModel(
            name: "Sprint",
            swimDistance: "0.5 miles",
            bikeDistance: "12.4 miles",
            runDistance: "3.1 miles"
        ),
        RaceTypeModel(
            name: "Custom",
            swimDistance: "100 yards",
            bikeDistance: "5 miles",
            runDistance: "1 mile"
        )
    ]
}
