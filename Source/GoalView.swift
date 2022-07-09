//
//  GoalView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/9/22.
//

import SwiftUI

struct EditableTimeView: View {
    var body: some View {
        Text("02:00")
            .foregroundColor(.accentColor)
            .underline()
    }
}

struct HeaderView: View {
    var body: some View {
        Label("Goals", systemImage: "timer")
            .font(.headline)
    }
}

struct RaceTypeView: View {
    var body: some View {
        HStack {
            Text("Race Type:")
            Text("Iron Man")
                .foregroundColor(.accentColor)
                .underline()
        }
    }
}

struct SportView: View {
    var sportName: String
    
    var body: some View {
        VStack {
            HStack {
                Text(sportName)
                Spacer()
                Text("1 mile")
            }
            HStack {
                EditableTimeView()
                Text("/ 50yds")
                Spacer()
                Text("Total:")
                EditableTimeView()
            }
        }
        .frame(maxWidth: 350)
    }
}

struct TransitionView: View {
    var body: some View {
        HStack {
            Text("Transition 1")
                .foregroundColor(.secondary)
            EditableTimeView()
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
    var body: some View {
        SportView(sportName: "Swim")
        Spacer()
        TransitionView()
        Spacer()
        SportView(sportName: "Bike")
        Spacer()
        TransitionView()
        Spacer()
        SportView(sportName: "Run")
    }
}

struct GoalView: View {
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            RaceTypeView()
            Spacer()
            AllLegsView()
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
