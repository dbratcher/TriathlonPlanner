//
//  GoalView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/9/22.
//

import SwiftUI


struct HeaderView: View {
    var body: some View {
        Label("Goals", systemImage: "timer")
            .font(.title)
    }
}


struct SportView: View {
    @ObservedObject var sportLegModel: SportLegModel
    var distance: String
    
    
    var body: some View {
        VStack {
            HStack {
                Text(sportLegModel.name)
                    .font(.headline)
                Spacer()
                Text(distance)
                    .font(.subheadline)
            }
            HStack {
                TimeButtonView(time: sportLegModel.splitTime)
                Text("/ 50yds")
                Spacer()
                Text("Total:")
                TimeButtonView(time: sportLegModel.totalTime, showHours: true)
            }
        }
        .frame(maxWidth: 350)
    }
}

struct TransitionView: View {
    @ObservedObject var transition: TransitionModel
    
    var body: some View {
        HStack {
            Text(transition.name)
                .foregroundColor(.secondary)
                .font(.headline)
            TimeButtonView(time: transition.time)
        }
    }
}

struct TotalTimeView: View {
    var body: some View {
        HStack {
            Text("Total Time:")
            Text("10:00:00")
        }
    }
}

struct AllLegsView: View {
    @StateObject var swim = SportLegModel(
        name: "Swim",
        totalTime: TimeModel(hours: 0, minutes: 5, seconds: 0)
    )
    @StateObject var transition1 = TransitionModel(name: "Transition 1", time: TimeModel(hours: 0, minutes: 5, seconds: 0))
    @StateObject var bike = SportLegModel(
        name: "Bike",
        totalTime: TimeModel(hours: 0, minutes: 5, seconds: 0)
    )
    @StateObject var transition2 = TransitionModel(name: "Transition 2", time: TimeModel(hours: 0, minutes: 5, seconds: 0))
    @StateObject var run = SportLegModel(
        name: "Run",
        totalTime: TimeModel(hours: 0, minutes: 5, seconds: 0)
    )
    
    @Binding var raceType: RaceTypeModel
    
    var body: some View {
        SportView(sportLegModel: swim, distance: raceType.swimDistance)
        Spacer()
        TransitionView(transition: transition1)
        Spacer()
        SportView(sportLegModel: bike, distance: raceType.bikeDistance)
        Spacer()
        TransitionView(transition: transition2)
        Spacer()
        SportView(sportLegModel: run, distance: raceType.runDistance)
    }
}

struct GoalView: View {
    @State private var raceType: RaceTypeModel = RaceTypeModel.raceTypes[0]
    
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            RaceTypeView(raceType: $raceType)
            Spacer()
            AllLegsView(raceType: $raceType)
            Spacer()
            TotalTimeView()
        }
        .frame(maxHeight: 450)
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
