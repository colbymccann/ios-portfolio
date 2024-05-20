//
//  SmartFilterRow.swift
//  PortfolioApp
//
//  Created by Colby McCann on 5/20/24.
//

import SwiftUI

struct SmartFilterRow: View {
    var filter: Filter
    
    var body: some View {
        NavigationLink(value: filter) {
            Label(LocalizedStringKey(filter.name), systemImage: filter.icon)
        }
    }
}

//#Preview {
//    SmartFilterRow(filter: .recent)
//}
