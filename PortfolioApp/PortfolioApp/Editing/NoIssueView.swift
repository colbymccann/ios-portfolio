//
//  NoIssueView.swift
//  PortfolioApp
//
//  Created by Colby McCann on 5/2/24.
//

import SwiftUI

struct NoIssueView: View {
    @EnvironmentObject var dataController: DataController

    var body: some View {
        Text("No Issue Selected")
            .font(.title)
            .foregroundStyle(.secondary)

        Button("New Issue") {
            dataController.newIssue()
        }
    }
}

#Preview {
    NoIssueView()
}
