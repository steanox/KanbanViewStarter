//
//  ColumnData.swift
//  KanbanView
//
//  Created by octavianus on 24/06/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import Foundation

let titles = """
Fix UIKIT,
Design Wireframe,
Held user interview,
Fix The notification button,
Meeting with Product Owner,
Handle back end,
Research for the front end
Have some sleep,
Learn about UISwift,
Handling bugs in the main menu,
Create mockup,
Learn more about user persona,
Give doggos some chips,
Configure apps deployment,
Call customer service,
Compare the New Difable data source
"""

struct KanbanColumn{
    let headerTitle: String
    let row: [KanbanRow]
    
    static func fetchTestData() -> [KanbanColumn]{
        var columns = [KanbanColumn]()
        columns.append(KanbanColumn(headerTitle: "Ready", row: KanbanRow.fetchTestData()))
        columns.append(KanbanColumn(headerTitle: "Progress", row: KanbanRow.fetchTestData()))
        columns.append(KanbanColumn(headerTitle: "Waiting", row: KanbanRow.fetchTestData()))
        columns.append(KanbanColumn(headerTitle: "Done", row: KanbanRow.fetchTestData()))
        columns.append(KanbanColumn(headerTitle: "Fail", row: KanbanRow.fetchTestData()))
        columns.append(KanbanColumn(headerTitle: "On Meeting", row: KanbanRow.fetchTestData()))
        columns.append(KanbanColumn(headerTitle: "Bye", row: KanbanRow.fetchTestData()))
        return columns
    }
}

struct KanbanRow{
    let title: String
    let priority: Int = Int.random(in: 0...3)
    
    static func fetchTestData() -> [KanbanRow]{
        let testData = titles.components(separatedBy: ",\n")
        let totalTestData = testData.count - 1
        
        
        var kanbanRow = [KanbanRow]()
        
        for data in 0...Int.random(in: 0...totalTestData){
            kanbanRow.append(KanbanRow(title: testData[Int.random(in: 0...totalTestData)]))
        }
        
        return kanbanRow
        
        
        
    }
}
