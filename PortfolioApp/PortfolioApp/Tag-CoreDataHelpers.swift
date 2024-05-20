//
//  Tag.swift
//  PortfolioApp
//
//  Created by Colby McCann on 5/2/24.
//

import Foundation
extension Tag {
    var tagID: UUID {
        id ?? UUID()
    }

    var tagName: String {
        name ?? ""
    }
    
    static var example: Tag {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let tag = Tag(context: viewContext)
        tag.id = UUID()
        tag.name = "Example Tag"
        return tag
    }
    
    var tagActiveIssues: [Issue] {
        let result = issues?.allObjects as? [Issue] ?? []
        return result.filter { $0.completed == false }
    }
}

extension Tag: Comparable {
    public static func <(lhs: Tag, rhs: Tag) -> Bool {
        let left = lhs.tagName.localizedLowercase
        let right = rhs.tagName.localizedLowercase

        if left == right {
            return lhs.tagID.uuidString < rhs.tagID.uuidString
        } else {
            return left < right
        }
    }
}

