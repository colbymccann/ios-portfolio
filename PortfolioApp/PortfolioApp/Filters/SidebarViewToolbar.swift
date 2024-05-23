//
//  SidebarViewToolbar.swift
//  PortfolioApp
//
//  Created by Colby McCann on 5/20/24.
//

import SwiftUI

struct SidebarViewToolbar: View {
    @EnvironmentObject var dataController: DataController
    @Binding var showingAwards: Bool

    var body: some View {
        Button {
            showingAwards.toggle()
        } label: {
            Label("Show awards", systemImage: "trophy")
        }
        Button {
            dataController.deleteAll()
            dataController.createSampleData()
        } label: {
            Label("ADD SAMPLES", systemImage: "flame")
        }
        Button(action: dataController.newTag) {
            Label("Add tag", systemImage: "tag.circle.fill")
        }
    }
}

#Preview {
    SidebarViewToolbar( showingAwards: .constant(false))
}
