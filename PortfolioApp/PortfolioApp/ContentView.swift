//
//  ContentView.swift
//  PortfolioApp
//
//  Created by Colby McCann on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataController: DataController

    
    func delete(_ offsets: IndexSet) {
        let issues = dataController.issuesForSelectedFilter()

        for offset in offsets {
            let item = issues[offset]
            dataController.delete(item)
        }
    }

    
    var body: some View {
        List(selection: $dataController.selectedIssue) {
            ForEach(dataController.issuesForSelectedFilter()) { issue in
                IssueRow(issue: issue)
            }
            .onDelete(perform: delete)
        }
        .searchable(text: $dataController.filterText, tokens: $dataController.filterTokens, suggestedTokens: .constant(dataController.suggestedFilterTokens), prompt: "Filter issues, or type # to add tags") { tag in
            Text(tag.tagName)
        }
        .toolbar {
            ContentViewToolbar()
        }
        .navigationTitle("Issues")
    }
}

#Preview {
    ContentView()
}
