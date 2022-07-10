//
//  EditableTimeView.swift
//  TriathlonPlanner
//
//  Created by Drew Bratcher on 7/10/22.
//

import SwiftUI

struct EditableTimeView: View {
    var time: String
    
    var body: some View {
        Text(time)
            .foregroundColor(.accentColor)
            .underline()
    }
}

struct EditableTimeView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTimeView(time: "10:00")
    }
}

