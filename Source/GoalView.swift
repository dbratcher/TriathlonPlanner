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
    @ObservedObject var race: RaceModel
    
    var body: some View {
        HStack {
            Text("Total Time:")
            Text(race.totalTime)
        }
    }
}

struct AllLegsView: View {
    @ObservedObject var race: RaceModel
    
    var body: some View {
        SportView(sportLegModel: race.swim, distance: race.type.swimDistance)
        Spacer()
        TransitionView(transition: race.transition1)
        Spacer()
        SportView(sportLegModel: race.bike, distance: race.type.bikeDistance)
        Spacer()
        TransitionView(transition: race.transition2)
        Spacer()
        SportView(sportLegModel: race.run, distance: race.type.runDistance)
    }
}

struct GoalView: View {
    
    @StateObject var race = RaceModel()

    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            RaceTypeView(raceType: $race.type)
            Spacer()
            AllLegsView(race: race)
            Spacer()
            TotalTimeView(race: race)
        }
        .frame(maxHeight: 450)
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
